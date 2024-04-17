import util from '@ohos.util';
/**
 * Basic list item data bean.
 */
export class ListDataItem {

  key: string = util.generateRandomUUID(true);
  name: string;
  icon: Resource;


  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
  }
}