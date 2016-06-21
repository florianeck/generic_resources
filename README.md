# Generic Resources

This gem adds an easy way to provide CRUD functionality for your models without the need to create a scaffold for every of them or even create on single controller!

## How to use

First of all, to use this plugin, you actually have to do a little bit of coding yourself.
This applies to the views. As your layout is not predictable for the gem, it is requiered to create the ways manually in order to fit your needs best.
[See view folder for examples](https://github.com/florianeck/generic_resources/tree/master/app/views/generic_resources/resources)

### In the model

Add `acts_as_generic_resource` to your model to register it as GenericResource and make it available to the GenericResourcesController

## Todo

- Write this README file
- Write Specs / Create Dummy App