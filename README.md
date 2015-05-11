# Boundary Modify Metric Intervals

This plugin modifies the metric interval values in the meter in order to reduce or increase the time to metric values.
The plugin modifies the values and then sleeps for a week before setting the values again.

## Prerequisites

### Supported OS

|     OS    | Linux | Windows | SmartOS | OS X |
|:----------|:-----:|:-------:|:-------:|:----:|
| Supported |   v   |    v    |    v    |  v   |

#### Boundary Meter Versions V4.0 Or Later

- To install new meter go to Settings->Installation or [see instructons|https://help.boundary.com/hc/en-us/sections/200634331-Installation]. 
- To upgrade the meter to the latest version - [see instructons|https://help.boundary.com/hc/en-us/articles/201573102-Upgrading-the-Boundary-Meter].

### Plugin Setup
None

#### Plugin Configuration Fields

|Field Name     |Description                                                                       |
|:--------------|:---------------------------------------------------------------------------------|
|probe          |The name of the probe interval to change                                          |
|ms             |The new interval value to replace the current value                               |

### Metrics Collected

None
