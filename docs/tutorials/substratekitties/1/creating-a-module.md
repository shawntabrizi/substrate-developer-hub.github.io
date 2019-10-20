---
title: Creating a Module
---

To start development, we will create a new Substrate runtime module.

## Substrate Module Template

Some of our introductory tutorial teach you to start building your Substrate runtime module directly in the Substrate node template. In this tutorial, we will teach you to develop your new runtime as it's own crate using the Substrate module template.

Building a runtime module with the module template is:

* + Easier to share your module with others
* - Harder to get started

It is considered best practice to develop your runtime modules as separate crates in this way, so we will do it!

To get the template, clone the following repository:

```
https://github.com/substrate-developer-hub/substrate-module-template
```

### Test Your Module

The Substrate module template comes with a dead simple runtime module. We will re-write this module from scratch to make sure you understand everything that is happening, but for now, let's just show you that it does compile and tests work as expected.

In the `substrate-module-template` folder, run:

```bash
cargo build
```

This will compile your runtime module. Then, to run the included test, run:

```bash
cargo test
```

If all goes well you should see the following:

```bash
$ cargo test
    Finished dev [unoptimized + debuginfo] target(s) in 0.13s
     Running target/debug/deps/substrate_module_template-a7d9657c97635530

running 1 test
test tests::it_works_for_default_value ... ok

test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out

   Doc-tests substrate-module-template

running 0 tests

test result: ok. 0 passed; 0 failed; 0 ignored; 0 measured; 0 filtered out
```

## Start From Scratch

The Substrate module template already does too much for you!

We want to make sure that you have a full and complete understanding of runtime development, so we want to start from scratch.

```
substrate-module-template
|
+-- src
	|
	+-- lib.rs  <-- Edit this file.
```

Replace the contents of the `src/lib.rs` file with the following boilerplate code:

```rust
#![cfg_attr(not(feature = "std"), no_std)]

use support::{decl_storage, decl_module};

pub trait Trait: system::Trait {}

decl_storage! {
    trait Store for Module<T: Trait> as KittyStorage {
        // Declare storage and getter functions here
    }
}

decl_module! {
    pub struct Module<T: Trait> for enum Call where origin: T::Origin {
        // Declare public functions here
    }
}
```

> **Note:** There is also a `template.rs` file provided by the `substrate-node-template`. In general, you can start building your new modules with that template. However, for the purposes of working from scratch, we will start in a new file.

**substratekitties<span>.</span>rs**

```rust
use support::{decl_storage, decl_module};

pub trait Trait: system::Trait {}

decl_storage! {
    trait Store for Module<T: Trait> as KittyStorage {
        // Declare storage and getter functions here
    }
}

decl_module! {
    pub struct Module<T: Trait> for enum Call where origin: T::Origin {
        // Declare public functions here
    }
}
```


## Your Turn!

If you have not already, follow the instructions on this page to set up your `substrate-node-template`. If you completed everything successfully, you should be able to compile your code successfully without errors:

```bash
cargo build
```

Now it's time to start adding some of our own logic!

