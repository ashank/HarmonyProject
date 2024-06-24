import { CommonConstants } from '../constants/CommonConstants';
import { ListDataItem } from '../viewmodel/ListDataItem';
import router from '@ohos.router';

/**
 * The MainPage that is routed as the SplashScreenPage.
 */
@Entry
@Component
struct IndexPage {

  aboutToAppear() {
  }

  aboutToDisappear() {
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Row(){
            Button('WaterFlow').onClick((event:ClickEvent) =>{
              router.replaceUrl(
                {url:CommonConstants.WATER_FLOW_PAGE_URL}
                ,(err) => {
                if (err) {
                  console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
                  return;
                }
                console.info('replaceUrl success');
              })

            })

            Button('List').onClick((event:ClickEvent) =>{
              router.replaceUrl(
                {url:CommonConstants.MAIN_PAGE_URL}
                ,(err) => {
                if (err) {
                  console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
                  return;
                }
                console.info('replaceUrl success');
              })

            })

            Button('Grid').onClick((event:ClickEvent) =>{
              router.replaceUrl(
                {url:CommonConstants.GRID_PAGE_URL}
                ,(err) => {
                if (err) {
                  console.error(`replaceUrl failed, code is ${err.code}, message is ${err.message}`);
                  return;
                }
                console.info('replaceUrl success');
              })

            })

          }.backgroundColor('#F2F2F2').width('100%').padding(12|10|12|10)

        }
        .backgroundColor('#FF00FF')
        .width('100%')
        .height('100%')
        .padding(12)
        .margin(0|0|0|0)
        .alignItems(HorizontalAlign.Start)
      }
    }
    .backgroundColor($r('app.color.start_window_background'))
  }
}