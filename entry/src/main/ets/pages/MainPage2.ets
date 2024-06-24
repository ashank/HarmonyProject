import { CommonConstants } from '../constants/CommonConstants';
import { ListDataItem } from '../viewmodel/ListDataItem';

/**
 * The MainPage that is routed as the SplashScreenPage.
 */
@Entry
@Component
struct MainPage2 {
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
      Scroll() {
        Column() {

          List(){
            ForEach(this.data,(item:ListDataItem) => {
              ListItem() {
                Row() {
                  Image($r('app.media.app_icon'))
                    .width(40)
                    .height(40)
                    .margin(10)
                  Text(item.name).fontSize(20)
                }
                .width('100%')
                .justifyContent(FlexAlign.Start)
              }

            },(item:ListDataItem) => item.key.toString()
            )
          }
          .width('100%')
          .height('100%')
          .alignListItem(ListItemAlign.Center)
          .margin(0|0|0|0)
        }
        .alignItems(HorizontalAlign.Start)
      }
    }
    .backgroundColor($r('app.color.start_window_background'))
  }
}