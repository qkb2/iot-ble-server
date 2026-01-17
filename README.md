# IOT BLE Buildroot image

### Cloning repository

```sh
git clone --recurse-submodules https://github.com/qkb2/iot-ble-server
cd iot-ble-server
```

### Setting configuration

```sh
make -C buildroot BR2_EXTERNAL=../ rpi4_64_ble_defconfig
```

#### Changing output directory

To change output directory, add `O=<output_dir>` to all `make` commands:
```sh
make -C buildroot O=../output rpi4_64_ble_defconfig
make -C buildroot O=../output nconfig
make -C buildroot O=../output -j$(nproc)
```

`output_dir` will be relative to `buildroot` directory.

### Changing configuration

#### Buildroot:

```sh
make -C buildroot nconfig
```

#### Linux:

```sh
make -C buildroot linux-nconfig
```

### Saving changes

#### Buildroot:

```sh
make -C buildroot savedefconfig
```

#### Linux:

```sh
make -C buildroot linux-savedefconfig
```

### Building

```sh
make -C buildroot -j$(nproc)
```
