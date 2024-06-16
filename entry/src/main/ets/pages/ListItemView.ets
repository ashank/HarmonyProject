
/**
 *  列表Item
 */
@Preview
@Component
export default struct ListItemView {
  private content?: string;
  @State message: string = 'Hello World';

  build() {
    ListItem() {
      Row() {
        Image($r('app.media.ic_video')).width(40).height(40)
        Text(this.content)
          .margin(10 | 0 | 0 | 0)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }.width('100%').backgroundColor('#F1F1F1').borderRadius(8).padding(12)
    }.selectable(true)
    .selected(true)
  }
}