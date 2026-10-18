# LTFS Tape Manager for Mac

Native SwiftUI tape manager using Aurora LTFS 1.5.0 and macFUSE 5.5.0 (FSKit).

## Interface

Four tabs: **Status**, **Read**, **Format**, and **Write**.

## Design goals

- Linear, sequential tape reads and writes to minimize seeking.
- Safe mount/unmount under `/Volumes` using macFUSE FSKit, without reduced macOS startup security.
- Selected file/folder restore, duplicate handling for tape writes, and sequential verification.

## Current development state

- v0.1.0: SwiftUI GUI built and launched on Apple Silicon macOS 26.3.
- v0.2.0: Hardware discovery and dependency diagnostics are next. Tape operations remain disabled pending actual drive and FSKit tests.

## Prerequisites

- Aurora LTFS 1.5.0 (`altfs -V`)
- macFUSE 5.5.0 with the FSKit file system extension enabled
- Supported SCSI tape drive and HBA

## Hardware diagnostics

With the tape drive connected and powered on, run `altfs -o device_list` and inspect `system_profiler SPPCIDataType` if the drive is not found. Do not format the tape just to test detection.
