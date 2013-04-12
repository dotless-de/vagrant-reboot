# VagrantReboot

This is a vagrant 1.0 and 1.1 compatible sample pulgin on how to reboot a machine using a vagrant middleware (action hook).

** It does not serve any particular use case! **

## What it does

* injects a middleware after the VirtualBoxProvider's boot action and triggers it's reload action.
* remembers that it ran for a vm before and won't run twice for it during a `vagrant up`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
