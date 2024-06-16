
/**
 *  列表Item
 */
@Preview
@Component
export default struct WaterFlowItemView {
  private content?: string;
  @State message: string = 'Hello World';

  build() {
    FlowItem() {
      Column() {
        Image('http://gips2.baidu.com/it/u=3944689179,983354166&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024')
          .width('100%')
          .height(100)
          .borderRadius(0|0|0|8)
          .objectFit(ImageFit.Cover)
          .alt($r('app.media.ic_video'))
          .autoResize(true)

        Text(this.content)
          .margin(0 | 10 | 0 | 10)
          .fontSize(14)
          .fontWeight(FontWeight.Normal)
          .fontStyle(FontStyle.Normal)

      }.width('100%')
      .backgroundColor('#F1F1F1')
      .borderRadius(8)
      .padding(0)
    }
  }
}