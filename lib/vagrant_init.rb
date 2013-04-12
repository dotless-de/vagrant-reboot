begin
  require "vagrant"
rescue LoadError
  raise "The Vagrant VBGuest plugin must be run within Vagrant."
end
raise "This plugin requires vagrant 1.0 and NO later." if Vagrant::VERSION >= '1.1.0'

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
      vm      = env[:vm]

      reboot(vm)
      @app.call(env)
    end

    def reboot(vm)
      if !@@rebooted[vm.uuid]
        @@rebooted[vm.uuid] = true
        vm.env.ui.warn "Rebooting just for fun..."
        vm.reload
      else
        vm.env.ui.success "Fun is over, going on ..."
      end
    end

  end
end

Vagrant.actions[:start].use VagrantReboot::Middleware
