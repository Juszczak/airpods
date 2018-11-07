import IOBluetooth

func toggleAirPods(_ deviceAddress: String?) {
    guard let bluetoothDevice = IOBluetoothDevice(addressString: hardcodedAddress ?? deviceAddress) else {
        print("Device not found")
        exit(-2)
    }

    if !bluetoothDevice.isPaired() {
        print("Device not paired")
        exit(-4)
    }

    if bluetoothDevice.isConnected() {
        bluetoothDevice.closeConnection()
    } else {
        bluetoothDevice.openConnection()
    }
}

let hardcodedAddress: String? = nil

var deviceAddress: String?

if CommandLine.arguments.count == 2 {
    deviceAddress = CommandLine.arguments[1]
} else {
    let homeDirPath = NSString(string: "~").expandingTildeInPath
    let configPath = "\(homeDirPath)/.airpods"

    do {
        deviceAddress = try String(contentsOfFile: configPath)
    } catch {
        print("Config could not be loaded")
        exit(-3)
    }
}

toggleAirPods(deviceAddress)
