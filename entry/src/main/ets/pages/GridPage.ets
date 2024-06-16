import { CommonConstants } from '../constants/CommonConstants';
import { ListDataItem } from '../viewmodel/ListDataItem';
import GridItemView from './GridItemView';

/**
 * The MainPage that is routed as the SplashScreenPage.
 */
@Entry
@Component
struct GridPage {
  private data: Array<object> = [
    new ListDataItem('小明', $r("app.media.app_icon")),
    new ListDataItem('如果', $r("app.media.app_icon")),
    new ListDataItem('啊收到', $r("app.media.app_icon")),
    new ListDataItem('阿卡丽', $r("app.media.app_icon")),
    new ListDataItem('哦ii哦', $r("app.media.app_icon")),
    new ListDataItem('很快就好看就好', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小红', $r("app.media.app_icon")),
    new ListDataItem('小明', $r("app.media.app_icon")),
  ]

  aboutToAppear() {
  }

  aboutToDisappear() {
  }

  build() {
        Column() {
          Grid(){
            ForEach(this.data,(item:ListDataItem) => {
              ForEach(this.data,(item:ListDataItem) => {
                GridItemView({content:item.name})
              },(item:ListDataItem) => item.key.toString()
              )
            },(item:ListDataItem) => item.key.toString()
            )
          }.cachedCount(10)
          .layoutDirection(GridDirection.Row)
          .scrollBar(BarState.Off)
          .margin(12|0|12|0)
          .columnsTemplate('1fr 1fr 1fr')
          .columnsGap(10)
          .rowsGap(10)
        }.width('100%')
        .height('100%')
        .backgroundColor($r('app.color.start_window_background'))
        .alignItems(HorizontalAlign.Start)

  }

  onBackPress(): boolean | void {
  }

}