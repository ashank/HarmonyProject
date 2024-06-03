import { CommonConstants } from '../constants/CommonConstants';
import { ListDataItem } from '../viewmodel/ListDataItem';
import Item from './Item';

/**
 * The MainPage that is routed as the SplashScreenPage.
 */
@Entry
@Component
struct MainPage {
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
        Column({space:30}) {

          Button('List')

          List(){
            ForEach(this.data,(item:ListDataItem) => {
              ListItem() {
                Item({content:item.name})
              }
            },(item:ListDataItem) => item.key.toString()
            )
          }
          .alignListItem(ListItemAlign.Center)
          .margin(0|0|0|0)
        }.width('100%')
        .height('100%')
        .backgroundColor($r('app.color.start_window_background'))
        .alignItems(HorizontalAlign.Start)

  }

}