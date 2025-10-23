defmodule Meshtastic.TelemetrySensorType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :SENSOR_UNSET, 0
  field :BME280, 1
  field :BME680, 2
  field :MCP9808, 3
  field :INA260, 4
  field :INA219, 5
  field :BMP280, 6
  field :SHTC3, 7
  field :LPS22, 8
  field :QMC6310, 9
  field :QMI8658, 10
  field :QMC5883L, 11
  field :SHT31, 12
  field :PMSA003I, 13
  field :INA3221, 14
  field :BMP085, 15
  field :RCWL9620, 16
  field :SHT4X, 17
  field :VEML7700, 18
  field :MLX90632, 19
  field :OPT3001, 20
  field :LTR390UV, 21
  field :TSL25911FN, 22
  field :AHT10, 23
  field :DFROBOT_LARK, 24
  field :NAU7802, 25
  field :BMP3XX, 26
  field :ICM20948, 27
  field :MAX17048, 28
  field :CUSTOM_SENSOR, 29
  field :MAX30102, 30
  field :MLX90614, 31
  field :SCD4X, 32
  field :RADSENS, 33
  field :INA226, 34
  field :DFROBOT_RAIN, 35
  field :DPS310, 36
  field :RAK12035, 37
  field :MAX17261, 38
  field :PCT2075, 39
  field :ADS1X15, 40
  field :ADS1X15_ALT, 41
  field :SFA30, 42
  field :SEN5X, 43
  field :TSL2561, 44
  field :BH1750, 45
end

defmodule Meshtastic.DeviceMetrics do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :battery_level, 1, proto3_optional: true, type: :uint32, json_name: "batteryLevel"
  field :voltage, 2, proto3_optional: true, type: :float

  field :channel_utilization, 3,
    proto3_optional: true,
    type: :float,
    json_name: "channelUtilization"

  field :air_util_tx, 4, proto3_optional: true, type: :float, json_name: "airUtilTx"
  field :uptime_seconds, 5, proto3_optional: true, type: :uint32, json_name: "uptimeSeconds"
end

defmodule Meshtastic.EnvironmentMetrics do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :temperature, 1, proto3_optional: true, type: :float
  field :relative_humidity, 2, proto3_optional: true, type: :float, json_name: "relativeHumidity"

  field :barometric_pressure, 3,
    proto3_optional: true,
    type: :float,
    json_name: "barometricPressure"

  field :gas_resistance, 4, proto3_optional: true, type: :float, json_name: "gasResistance"
  field :voltage, 5, proto3_optional: true, type: :float
  field :current, 6, proto3_optional: true, type: :float
  field :iaq, 7, proto3_optional: true, type: :uint32
  field :distance, 8, proto3_optional: true, type: :float
  field :lux, 9, proto3_optional: true, type: :float
  field :white_lux, 10, proto3_optional: true, type: :float, json_name: "whiteLux"
  field :ir_lux, 11, proto3_optional: true, type: :float, json_name: "irLux"
  field :uv_lux, 12, proto3_optional: true, type: :float, json_name: "uvLux"
  field :wind_direction, 13, proto3_optional: true, type: :uint32, json_name: "windDirection"
  field :wind_speed, 14, proto3_optional: true, type: :float, json_name: "windSpeed"
  field :weight, 15, proto3_optional: true, type: :float
  field :wind_gust, 16, proto3_optional: true, type: :float, json_name: "windGust"
  field :wind_lull, 17, proto3_optional: true, type: :float, json_name: "windLull"
  field :radiation, 18, proto3_optional: true, type: :float
  field :rainfall_1h, 19, proto3_optional: true, type: :float, json_name: "rainfall1h"
  field :rainfall_24h, 20, proto3_optional: true, type: :float, json_name: "rainfall24h"
  field :soil_moisture, 21, proto3_optional: true, type: :uint32, json_name: "soilMoisture"
  field :soil_temperature, 22, proto3_optional: true, type: :float, json_name: "soilTemperature"
end

defmodule Meshtastic.PowerMetrics do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :ch1_voltage, 1, proto3_optional: true, type: :float, json_name: "ch1Voltage"
  field :ch1_current, 2, proto3_optional: true, type: :float, json_name: "ch1Current"
  field :ch2_voltage, 3, proto3_optional: true, type: :float, json_name: "ch2Voltage"
  field :ch2_current, 4, proto3_optional: true, type: :float, json_name: "ch2Current"
  field :ch3_voltage, 5, proto3_optional: true, type: :float, json_name: "ch3Voltage"
  field :ch3_current, 6, proto3_optional: true, type: :float, json_name: "ch3Current"
  field :ch4_voltage, 7, proto3_optional: true, type: :float, json_name: "ch4Voltage"
  field :ch4_current, 8, proto3_optional: true, type: :float, json_name: "ch4Current"
  field :ch5_voltage, 9, proto3_optional: true, type: :float, json_name: "ch5Voltage"
  field :ch5_current, 10, proto3_optional: true, type: :float, json_name: "ch5Current"
  field :ch6_voltage, 11, proto3_optional: true, type: :float, json_name: "ch6Voltage"
  field :ch6_current, 12, proto3_optional: true, type: :float, json_name: "ch6Current"
  field :ch7_voltage, 13, proto3_optional: true, type: :float, json_name: "ch7Voltage"
  field :ch7_current, 14, proto3_optional: true, type: :float, json_name: "ch7Current"
  field :ch8_voltage, 15, proto3_optional: true, type: :float, json_name: "ch8Voltage"
  field :ch8_current, 16, proto3_optional: true, type: :float, json_name: "ch8Current"
end

defmodule Meshtastic.AirQualityMetrics do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :pm10_standard, 1, proto3_optional: true, type: :uint32, json_name: "pm10Standard"
  field :pm25_standard, 2, proto3_optional: true, type: :uint32, json_name: "pm25Standard"
  field :pm100_standard, 3, proto3_optional: true, type: :uint32, json_name: "pm100Standard"

  field :pm10_environmental, 4,
    proto3_optional: true,
    type: :uint32,
    json_name: "pm10Environmental"

  field :pm25_environmental, 5,
    proto3_optional: true,
    type: :uint32,
    json_name: "pm25Environmental"

  field :pm100_environmental, 6,
    proto3_optional: true,
    type: :uint32,
    json_name: "pm100Environmental"

  field :particles_03um, 7, proto3_optional: true, type: :uint32, json_name: "particles03um"
  field :particles_05um, 8, proto3_optional: true, type: :uint32, json_name: "particles05um"
  field :particles_10um, 9, proto3_optional: true, type: :uint32, json_name: "particles10um"
  field :particles_25um, 10, proto3_optional: true, type: :uint32, json_name: "particles25um"
  field :particles_50um, 11, proto3_optional: true, type: :uint32, json_name: "particles50um"
  field :particles_100um, 12, proto3_optional: true, type: :uint32, json_name: "particles100um"
  field :co2, 13, proto3_optional: true, type: :uint32
  field :co2_temperature, 14, proto3_optional: true, type: :float, json_name: "co2Temperature"
  field :co2_humidity, 15, proto3_optional: true, type: :float, json_name: "co2Humidity"
  field :form_formaldehyde, 16, proto3_optional: true, type: :float, json_name: "formFormaldehyde"
  field :form_humidity, 17, proto3_optional: true, type: :float, json_name: "formHumidity"
  field :form_temperature, 18, proto3_optional: true, type: :float, json_name: "formTemperature"
  field :pm40_standard, 19, proto3_optional: true, type: :uint32, json_name: "pm40Standard"
  field :particles_40um, 20, proto3_optional: true, type: :uint32, json_name: "particles40um"
  field :pm_temperature, 21, proto3_optional: true, type: :float, json_name: "pmTemperature"
  field :pm_humidity, 22, proto3_optional: true, type: :float, json_name: "pmHumidity"
  field :pm_voc_idx, 23, proto3_optional: true, type: :float, json_name: "pmVocIdx"
  field :pm_nox_idx, 24, proto3_optional: true, type: :float, json_name: "pmNoxIdx"
  field :particles_tps, 25, proto3_optional: true, type: :float, json_name: "particlesTps"
end

defmodule Meshtastic.LocalStats do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :uptime_seconds, 1, type: :uint32, json_name: "uptimeSeconds"
  field :channel_utilization, 2, type: :float, json_name: "channelUtilization"
  field :air_util_tx, 3, type: :float, json_name: "airUtilTx"
  field :num_packets_tx, 4, type: :uint32, json_name: "numPacketsTx"
  field :num_packets_rx, 5, type: :uint32, json_name: "numPacketsRx"
  field :num_packets_rx_bad, 6, type: :uint32, json_name: "numPacketsRxBad"
  field :num_online_nodes, 7, type: :uint32, json_name: "numOnlineNodes"
  field :num_total_nodes, 8, type: :uint32, json_name: "numTotalNodes"
  field :num_rx_dupe, 9, type: :uint32, json_name: "numRxDupe"
  field :num_tx_relay, 10, type: :uint32, json_name: "numTxRelay"
  field :num_tx_relay_canceled, 11, type: :uint32, json_name: "numTxRelayCanceled"
  field :heap_total_bytes, 12, type: :uint32, json_name: "heapTotalBytes"
  field :heap_free_bytes, 13, type: :uint32, json_name: "heapFreeBytes"
  field :num_tx_dropped, 14, type: :uint32, json_name: "numTxDropped"
end

defmodule Meshtastic.HealthMetrics do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :heart_bpm, 1, proto3_optional: true, type: :uint32, json_name: "heartBpm"
  field :spO2, 2, proto3_optional: true, type: :uint32
  field :temperature, 3, proto3_optional: true, type: :float
end

defmodule Meshtastic.HostMetrics do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :uptime_seconds, 1, type: :uint32, json_name: "uptimeSeconds"
  field :freemem_bytes, 2, type: :uint64, json_name: "freememBytes"
  field :diskfree1_bytes, 3, type: :uint64, json_name: "diskfree1Bytes"
  field :diskfree2_bytes, 4, proto3_optional: true, type: :uint64, json_name: "diskfree2Bytes"
  field :diskfree3_bytes, 5, proto3_optional: true, type: :uint64, json_name: "diskfree3Bytes"
  field :load1, 6, type: :uint32
  field :load5, 7, type: :uint32
  field :load15, 8, type: :uint32
  field :user_string, 9, proto3_optional: true, type: :string, json_name: "userString"
end

defmodule Meshtastic.Telemetry do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  oneof :variant, 0

  field :time, 1, type: :fixed32
  field :device_metrics, 2, type: Meshtastic.DeviceMetrics, json_name: "deviceMetrics", oneof: 0

  field :environment_metrics, 3,
    type: Meshtastic.EnvironmentMetrics,
    json_name: "environmentMetrics",
    oneof: 0

  field :air_quality_metrics, 4,
    type: Meshtastic.AirQualityMetrics,
    json_name: "airQualityMetrics",
    oneof: 0

  field :power_metrics, 5, type: Meshtastic.PowerMetrics, json_name: "powerMetrics", oneof: 0
  field :local_stats, 6, type: Meshtastic.LocalStats, json_name: "localStats", oneof: 0
  field :health_metrics, 7, type: Meshtastic.HealthMetrics, json_name: "healthMetrics", oneof: 0
  field :host_metrics, 8, type: Meshtastic.HostMetrics, json_name: "hostMetrics", oneof: 0
end

defmodule Meshtastic.Nau7802Config do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.14.0", syntax: :proto3

  field :zeroOffset, 1, type: :int32
  field :calibrationFactor, 2, type: :float
end
