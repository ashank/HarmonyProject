import { CommonConstants } from '../constants/CommonConstants';
import { ListDataItem } from '../viewmodel/ListDataItem';
import GridItemView from './GridItemView';
import { WaterFlowDataSource } from './WaterFlowDataSource';
import WaterFlowItemView from './WaterFlowItemView';

/**
 * The MainPage that is routed as the SplashScreenPage.
 */
@Entry
@Component
struct GridPage {

  private data: Array<ListDataItem> = [
    new ListDataItem('小明', $r("app.media.app_icon")),
    new ListDataItem('如果', $r("app.media.app_icon")),
    new ListDataItem('啊收到', $r("app.media.app_icon")),
    new ListDataItem('阿卡丽', $r("app.media.app_icon")),
    new ListDataItem('哦ii哦', $r("app.media.app_icon")),
    new ListDataItem('很快就好看就好', $r("app.media.app_icon")),
    new ListDataItem('小红很快就好很快就好看就好很快就好看就好很快就好看就好看就好', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小很快就好看就好很快就好看就好很快就好看就好红', $r("app.media.app_icon")),
    new ListDataItem('小很快就好看就好很快就好看就好红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小很快就好看就好很快就好看就好红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小明', $r("app.media.app_icon")),

    new ListDataItem('这是结束的视图', $r("app.media.app_icon")),
  ]

  private datalist = new WaterFlowDataSource(this.data)

  aboutToAppear() {
  }

  aboutToDisappear() {
  }

  @Builder itemFoot() {
    Column() {
      Text(`Footer`)
        .fontSize(10)
        .backgroundColor(Color.Red)
        .width(50)
        .height(50)
        .align(Alignment.Center)
        .margin({ top: 2 })
    }
  }

  build() {
        Column() {
          WaterFlow({footer:this.itemFoot(),scroller:new Scroller()}){
            LazyForEach(this.datalist,(item: ListDataItem,index:number) => {
              WaterFlowItemView({content:item.name})
            })
          }.cachedCount(10)
          .layoutDirection(FlexDirection.Column)
          .columnsTemplate('1fr 1fr 2fr')
          .scrollBar(BarState.Off)
          .margin(12|0|12|0)
          .columnsGap(10)
          .rowsGap(10)
          .itemConstraintSize({
            minWidth: 0,
            maxWidth: '100%',
            minHeight: 0,
            maxHeight: '100%'
          })
          .onReachStart(() => {
            console.info("WaterFlow onReachStart")
          })
          .onReachEnd(() => {
            console.info("WaterFlow onReachEnd")
          })
          .backgroundColor(0xFAEEE0)
        }.width('100%')
        .height('100%')
        .backgroundColor($r('app.color.start_window_background'))
        .alignItems(HorizontalAlign.Start)

  }

  onBackPress(): boolean | void {
  }

}