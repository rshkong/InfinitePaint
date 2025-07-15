# InfinitePaint
This project contains a minimal example of an infinite canvas note taking
application built for Huawei HarmonyOS devices. The implementation is
written in **ArkTS**, following a simple MVC structure and SOLID
principles. It demonstrates how to implement an infinite canvas view with
pan and zoom support on touch devices.

### Build

Use the HarmonyOS SDK tooling to build and deploy the `entry` module to a
tablet or phone. From the project root run:

```
hdc shell build entry
```

Replace `hdc` commands with the appropriate build commands from your
development environment.

### Installing Dependencies

HarmonyOS projects expect an `oh-package.json5` file at the project root.
Run the following command to install packages before building:

```
ohpm install --all
```

### Project Structure

The HarmonyOS source code for this sample resides in `entry/src/main/ets`.
Within this folder you will find:

- `MainAbility/MainAbility.ets` – the app entry point
- `pages/` – UI components such as `Index.ets`
- `controller/`, `model/`, and `view/` – MVC implementation files

### Uploading Your Changes

To share your local modifications, commit them and push to your Git remote:

```bash
git add .
git commit -m "Describe your changes"
git push origin <branch-name>
```
