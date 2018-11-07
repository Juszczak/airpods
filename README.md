# AirPods CLI

Connect/disconnect AirPods from the Command Line

## build
```
swiftc AirPods.swift
```

## run

### With argument
Pass AirPods MAC address as an argument:
```
./AirPods 00-00-00-00-00-00
```

### Without config

1. Create `.airpods` file in your home directory containing your AirPods MAC address.
2. Run:
```
./AirPods
```

To find out your AirPods MAC address try:
```
swift ListDevices.swift
```
