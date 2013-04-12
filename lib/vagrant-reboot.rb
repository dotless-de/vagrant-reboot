begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant VBGuest plugin must be run within Vagrant."
end
raise "This plugin requires vagrant 1.1 or later." if Vagrant::VERSION < '1.1.0'

require "vagrant-reboot/version"

module VagrantReboot

  class Middleware
    @@rebooted = {}

    def initialize(app, env)
      @app = app
      @env = env
    end

    def call(env)
      @env    = env
      vm      = env[:machine]

      reboot(vm)
      @app.call(env)
    end

    def reboot(vm)
      if !@@rebooted[vm.id]
        @@rebooted[vm.id] = true
        vm.env.ui.warn "Rebooting just for fun..."
        vm.action(:reload)
      else
        vm.env.ui.success "Fun is over, going on ..."
      end
    end
  end


  class Plugin < Vagrant.plugin("2")
    name "vagrant reboot"
    description "A sample plugin wich reboots a box just after it came up for the first time"

    action_hook("install_guest_additions", :boot) do |hook|
      hook.after(VagrantPlugins::ProviderVirtualBox::Action::Boot, VagrantReboot::Middleware)
    end
  end
end
