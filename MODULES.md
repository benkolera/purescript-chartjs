# Module Documentation

## Module ChartJs

### Types

    data BarChartConfig where
      BarChartConfig :: BarChartConfig

    type BarChartData = { datasets :: [BarChartDataset], labels :: [String] }

    type BarChartDataset = { "data" :: [Number], highlightStroke :: String, highlightFill :: String, strokeColor :: String, fillColor :: String }

    data Chart :: *

    data ChartType :: *

    data DoughnutChartConfig where
      DoughnutChartConfig :: DoughnutChartConfig

    type DoughnutChartData = { highlight :: String, color :: String, label :: String, value :: Number }

    data LineChartConfig where
      LineChartConfig :: LineChartConfig

    type LineChartData = { datasets :: [LineChartDataset], labels :: [String] }

    type LineChartDataset = { "data" :: [Number], pointHighlightStroke :: String, pointHighlightFill :: String, pointStrokeColor :: String, pointColor :: String, strokeColor :: String, fillColor :: String, label :: String }

    data PieChartConfig where
      PieChartConfig :: PieChartConfig

    type PieChartData = { highlight :: String, color :: String, label :: String, value :: Number }

    data PolarAreaChartConfig where
      PolarAreaChartConfig :: PolarAreaChartConfig

    type PolarAreaChartData = { highlight :: String, color :: String, label :: String, value :: Number }

    data RadarChartConfig where
      RadarChartConfig :: RadarChartConfig

    type RadarChartData = { datasets :: [RadarChartDataset], labels :: [String] }

    type RadarChartDataset = { "data" :: [Number], pointHighlightStroke :: String, pointHighlightFill :: String, pointStrokeColor :: String, pointColor :: String, strokeColor :: String, fillColor :: String, label :: String }


### Values

    barChart :: forall eff. Chart -> BarChartData -> BarChartConfig -> Eff (dom :: DOM | eff) ChartType

    doughnutChart :: forall eff. Chart -> [DoughnutChartData] -> DoughnutChartConfig -> Eff (dom :: DOM | eff) ChartType

    lineChart :: forall eff. Chart -> LineChartData -> LineChartConfig -> Eff (dom :: DOM | eff) ChartType

    newChart :: forall eff. Context2D -> Eff (dom :: DOM | eff) Chart

    pieChart :: forall eff. Chart -> [PieChartData] -> PieChartConfig -> Eff (dom :: DOM | eff) ChartType

    polarAreaChart :: forall eff. Chart -> [PolarAreaChartData] -> PolarAreaChartConfig -> Eff (dom :: DOM | eff) ChartType

    radarChart :: forall eff. Chart -> RadarChartData -> RadarChartConfig -> Eff (dom :: DOM | eff) ChartType



