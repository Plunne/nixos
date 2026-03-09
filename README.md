# NixOS

My NixOS configuration

## Architecture

```
NixOS/
│
├─ hardware/
│  ├─ default.nix
│  ├─ components.nix     # CPU/GPU
│  └─ peripherals.nix   # Audio/Bluetooth/Printers/etc.
│
├─ machines/
│  ├─ bonbon.nix        # PC
│  ├─ cookie.nix        # VM Nix
│  └─ tiramisu.nix      # Laptop
│
├─ software/
│  ├─ default.nix
│  ├─ ct.nix            # Containers
│  ├─ dm.nix            # Desktop Manager
│  ├─ vm.nix            # Virtual Machines
│  └─ wm.nix            # Windows Manager
│
├─ system/
│  ├─ default.nix
│  ├─ boot.nix          # Bootloader
│  ├─ locales.nix       # Locales
│  ├─ network.nix       # Networking
│  └─ users.nix         # Users
│
├─ configuration.nix
├─ packages.nix
└─ vars.nix
```



-----

# CREDITS

Thanks to following peoples for helping me :

- [liberodark](https://github.com/liberodark) : My first Nix sensei


