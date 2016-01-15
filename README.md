# Option select test page

### Running the app

1. clone the [Static](https://github.com/alphagov/static) app into your `govuk` folder and checkout the `add-closed-state-to-form-data` branch
2. clone the [Option-select test](https://github.com/tombye/option-select-test) app into your `govuk` folder
3. create a basic Virtual Machine (VM) using the supplied files, run it and ssh into it
5. bundle both apps and run them

#### Creating the VM

If you haven't got it, get [Vagrant](https://www.vagrantup.com/).

Create yourself a copy of this [Vagrantfile](https://gist.github.com/tombye/47ef9fd4095685e514ce) and change the `GOVUK_FOLDER` variable to point at the `govuk` folder on your machine.

Create yourself a copy of this [provisioning script](https://gist.github.com/tombye/cb421c675f423b7dc4a7) and put it in the folder they both sit in.

Run `vagrant up` in that folder and `vagrant ssh` when it's ready to log into it.

When logged in, you can get to the `govuk` folder by going to `/var/govuk` on the VM.

#### Run both apps

Run `bundle install` in both apps and run them like so:

- for Static, run `GOVUK_ASSET_ROOT=10.1.1.254:3013 bundle exec rails s -p 3013 -b 0.0.0.0`
- for Option-select-test, run `PLEK_SERVICE_STATIC_URI=127.0.0.1:3013 ./startup.sh`

Go to [http://10.1.1.254:3113/](http://10.1.1.254:3113/) to see the test page.

