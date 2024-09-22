import { abilityAccessCtrl, bundleManager, PermissionRequestResult, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';

/** * @author Zhihan * @version 1.0 * @date: 2024/8/14 * @description 权限管理类 * user_grant（用户授权）权限列表 以下权限的授权方式均为user_grant（用户授权），申请方式请参考声明权限 > 向用户申请授权 。 ohos.permission.ACCESS_BLUETOOTH 允许应用接入蓝牙并使用蓝牙能力，例如配对、连接外围设备等。 权限级别：normal 授权方式：user_grant 起始版本：10 ohos.permission.MEDIA_LOCATION 允许应用访问用户媒体文件中的地理位置信息。 权限级别：normal 授权方式：user_grant 起始版本：7 ohos.permission.APP_TRACKING_CONSENT 允许应用读取开放匿名设备标识符。 权限级别：normal 授权方式：user_grant 起始版本：9 ohos.permission.ACTIVITY_MOTION 允许应用读取用户的运动状态。 权限级别：normal 授权方式：user_grant 起始版本：7 ohos.permission.CAMERA 允许应用使用相机。 权限级别：normal 授权方式：user_grant 起始版本：9 ohos.permission.DISTRIBUTED_DATASYNC 允许不同设备间的数据交换。 权限级别：normal 授权方式：user_grant 起始版本：7 ohos.permission.LOCATION_IN_BACKGROUND 允许应用在后台运行时获取设备位置信息。 由于安全隐私要求，应用不能通过弹窗的形式被授予后台位置权限，应用如果需要使用后台位置权限，需要引导用户到设置界面手动授予。 申请流程： 通过弹窗申请前台位置权限。存在两种允许情况： 申请前台模糊位置权限：ohos.permission.APPROXIMATELY_LOCATION。 申请前台精确位置权限：ohos.permission.APPROXIMATELY_LOCATION和ohos.permission.LOCATION。 当用户点击弹窗授予前台位置权限后，应用通过弹窗、提示窗等形式告知用户前往设置界面授予后台位置权限。 用户在设置界面中的选择“始终允许”应用访问位置信息权限，完成手动授予。 设置路径： 路径一：设置 > 隐私和安全 > 位置信息 > 具体应用 路径二：设置 > 应用和元服务 > 某个应用 权限级别：normal 授权方式：user_grant 起始版本：7 ohos.permission.LOCATION 允许应用获取设备位置信息。 申请条件：需要与模糊位置权限ohos.permission.APPROXIMATELY_LOCATION一起，才可申请此权限。 权限级别：normal 授权方式：user_grant 起始版本：7 ohos.permission.APPROXIMATELY_LOCATION 允许应用获取设备模糊位置信息。 权限级别：normal 授权方式：user_grant 起始版本：9 ohos.permission.MICROPHONE 允许应用使用麦克风。 权限级别：normal 授权方式：user_grant 起始版本：8 ohos.permission.READ_CALENDAR 允许应用读取日历信息。 权限级别：normal 授权方式：user_grant 起始版本：8 ohos.permission.WRITE_CALENDAR 允许应用添加、移除或更改日历活动。 权限级别：normal 授权方式：user_grant 起始版本：8 ohos.permission.READ_HEALTH_DATA 允许应用读取用户的健康数据。 权限级别：normal 授权方式：user_grant 起始版本：7 ohos.permission.ACCESS_NEARLINK 允许应用接入星闪并使用星闪能力，例如配对、连接外围设备等。 权限级别：normal 授权方式：user_grant 起始版本：12 ohos.permission.READ_WRITE_DOWNLOAD_DIRECTORY 允许应用访问公共目录下Download目录及子目录。 权限级别：API version 11为system_basic; 从API version 12开始为normal。 授权方式：user_grant 起始版本：11 ohos.permission.READ_WRITE_DOCUMENTS_DIRECTORY 允许应用访问公共目录下的Documents目录及子目录。 权限级别：API version 11为system_basic; 从API version 12开始为normal。 授权方式：user_grant 起始版本：11 ohos.permission.READ_MEDIA 允许应用读取用户外部存储中的媒体文件信息。 权限级别：normal 授权方式：user_grant 起始版本：7 废弃版本：12 替代方案： 请参考文件权限组废弃替代方案。 ohos.permission.WRITE_MEDIA 允许应用读写用户外部存储中的媒体文件信息。 权限级别：normal 授权方式：user_grant 起始版本：7 废弃版本：12 替代方案： 请参考文件权限组废弃替代方案。 @link{https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/permissions-for-all-V5} * * */
/** * 权限工具类 */
export class THPermission {
  private constructor() {
    // 初始化操作
  }

  private static instance: THPermission;

  // 全局访问点，用于获取单例
  public static getInstance(): THPermission {
    if (!THPermission.instance) {
      THPermission.instance = new THPermission();
    }
    return THPermission.instance;
  }

  /**   * 申请定位权限   * @param context  如：getContext(this) as common.UIAbilityContext;   */
  async requestPermission(context: Context, permissions: Array<Permissions>): Promise<PermissionRequestResult> {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    const result = await atManager.requestPermissionsFromUser(context, permissions);
    return result
  }

  /**   * 跳转到 系统设置   *   * Note: 从未申请过授权的权限 无法跳转到 设置页面   * @param context  如：getContext(this) as common.UIAbilityContext;   * @param permissionList   */
  gotoPermissionSetting(context: Context, permissionList: Array<Permissions>) {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    atManager.requestPermissionOnSetting(context, permissionList).then((data: Array<abilityAccessCtrl.GrantStatus>) => {
      console.log('THPermission gotoPermissionSetting 执行结果:%{public}s', JSON.stringify(data));
    }).catch((err: BusinessError) => {
      console.log('THPermission gotoPermissionSetting error:%{public}s', JSON.stringify(err));
    });
  }

  /**   * 跳转到 系统设置   *   * Note: 从未申请过授权的权限 无法跳转到 设置页面   * @param context  如：getContext(this) as common.UIAbilityContext;   * @param permissionList   */
  async gotoPermissionSettingAsync(context: Context,
    permissionList: Array<Permissions>): Promise<Array<abilityAccessCtrl.GrantStatus>> {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let result = await atManager.requestPermissionOnSetting(context, permissionList);
    return result;
  }

  /**   * 打开 硬件开关  如 相机、定位、蓝牙   * @param context   * @param type   * @returns   */
  async requestGlobalSwitch(context: Context, type: abilityAccessCtrl.SwitchType): Promise<boolean> {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let result = await atManager.requestGlobalSwitch(context, type)
    return result;
  }

  /**   * 检测 权限是否授权   * @param context  如：getContext(this) as common.UIAbilityContext;   * @param permissionList   * @returns   */
  async checkPermissions(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus> {
    // 获取应用程序的accessTokenID
    let tokenId: number = 0;
    try {
      let bundleInfo: bundleManager.BundleInfo =
        await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo;
      tokenId = appInfo.accessTokenId;
      console.log('THPermission checkPermissions tokenId:%{public}d ', tokenId);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      console.log('THPermission checkPermissions error:%{public}s ', JSON.stringify(err));
    }
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    let grantStatus: abilityAccessCtrl.GrantStatus = await atManager.checkAccessToken(tokenId, permission);
    return grantStatus
  }

  /**   * 检测权限是否全部允许   * @param permissions 权限列表   */
  async checkPermissionsAllAllowed(permissions: Array<Permissions>): Promise<boolean> {
    let length: number = permissions.length;
    if (length == 0) {
      return false
    }
    let result = false
    for (let i = 0; i < length; i++) {
      result = await THPermission.getInstance().checkPermissions(permissions[i]) ===
      abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED
      if (!result) {
        break
      }
    }
    return result
  }

  /**   * 检测权限 是否通过（至少一个权限被通过）   * @param permissions 权限列表   * @returns   */
  async checkPermissionsAtLeastOneAllowed(permissions: Array<Permissions>): Promise<boolean> {
    let length: number = permissions.length;
    if (length == 0) {
      return false
    }
    let result = false
    for (let i = 0; i < length; i++) {
      result = await THPermission.getInstance().checkPermissions(permissions[i]) ===
      abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED
      if (result) {
        break
      }
    }
    return result
  }

  /**   * 检测权限是否全部拒绝   * @param permissions 权限列表   */
  async checkPermissionsAllRefused(permissions: Array<Permissions>): Promise<boolean> {
    let length: number = permissions.length;
    if (length == 0) {
      return false
    }
    let results = Array<boolean>(length)
    for (let i = 0; i < length; i++) {
      let r = await THPermission.getInstance().checkPermissions(permissions[i]) ===
      abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED
      if (!r) {
        results[i] = r
      }
    }
    if (results.length == length) {
      return true
    } else {
      return false
    }
  }
}
