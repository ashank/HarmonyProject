import { abilityAccessCtrl, Context, Permissions } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { PermissionConstants } from './PermissionConstants';
import { THPermission } from './THPermission';

/** * @author Zhiyahan * @version 1.0 * @date: 2024/8/15 * @description 权限管理 */
export class THPermissionManager {
  private constructor() {
    // 初始化操作
  }

  private static instance: THPermissionManager;

  // 全局访问点，用于获取单例
  public static getInstance(): THPermissionManager {
    if (!THPermissionManager.instance) {
      THPermissionManager.instance = new THPermissionManager();
    }
    return THPermissionManager.instance;
  }

  private name: string = "PERMISSION"

  /**   * 请求定位权限流程   * @param context   * @returns   */
  async requestLocationPermission(context: Context, isShowPrompt: boolean): Promise<boolean> {
    let result = await this.requestPermission(context, isShowPrompt, PermissionConstants.TITLE_LOCATION,
      PermissionConstants.CONTENT_LOCATION, ['ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'])
    return result
  }

  /**   * 申请后台权限   * @param context   */
  async requestLocationBackgroundPermission(context: Context): Promise<boolean> {
    let permission: Array<Permissions> = ['ohos.permission.LOCATION_IN_BACKGROUND'] //判断定位是否授予
    let isLocation = await THPermission.getInstance()
      .checkPermissionsAtLeastOneAllowed(['ohos.permission.LOCATION', 'ohos.permission.APPROXIMATELY_LOCATION'])
    //后台权限是否授予
    let isLocationBackground =
      await THPermission.getInstance().checkPermissions('ohos.permission.LOCATION_IN_BACKGROUND') ==
      abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED
    if (isLocationBackground) {
      return isLocationBackground
    }
    if (!isLocationBackground && isLocation) {
      let result = await THPermission.getInstance().gotoPermissionSettingAsync(context, permission)
      let length = result.length
      let isGranted = false
      for (let i = 0; i < length; i++) {
        isGranted = result[i] === abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED
        if (!isGranted) {
          break
        }
      }
      return isGranted
    }
    return false
  }

  /**   * 请求相机权限流程   * @param context   * @returns   */
  async requestCameraPermission(context: Context, isShowPrompt: boolean): Promise<boolean> {
    let result = await this.requestPermission(context, isShowPrompt, PermissionConstants.TITLE_CAMERA,
      PermissionConstants.CONTENT_CAMERA, ['ohos.permission.MICROPHONE'])
    return result
  }

  /**   * 请求麦克风权限流程   * @param context   * @returns   */
  async requestMicroPhonePermission(context: Context, isShowPrompt: boolean): Promise<boolean> {
    let result = await this.requestPermission(context, isShowPrompt, PermissionConstants.TITLE_MICROPHONE,
      PermissionConstants.CONTENT_MICROPHONE, ['ohos.permission.MICROPHONE'])
    return result
  }

  /**   * 请求权限流程   * @param context   * @returns   */
  private async requestPermission(context: Context, isShowPrompt: boolean, promptTitle: string, promptContent: string,
    permissions: Array<Permissions>): Promise<boolean> {
    if (permissions.length == 0) {
      return false
    } //第一次权限申请
    let isFirstPermission = true
    if (isFirstPermission == undefined) {
      isFirstPermission = true
    }
    //至少有一个权限同意了，则代表同意了了
    let isAllowPermission = await THPermission.getInstance().checkPermissionsAllAllowed(permissions)
    if (isAllowPermission) {
      //获得权限
      return new Promise((resolve) => {
        resolve(isAllowPermission);
      });
    }
    if (isFirstPermission && !isAllowPermission) {
      //第一次申请
      isFirstPermission = false
      return new Promise((resolve) => {
        THPermission.getInstance().requestPermission(context, permissions).then((permissionRequestResult) => {
          let grantStatus: Array<number> = permissionRequestResult.authResults;
          let length: number = grantStatus.length;
          let result = false
          for (let i = 0; i < length; i++) {
            result = grantStatus[i] == abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED
            if (result) {
              break
            }
          }
          resolve(result);
        }).catch((error: BusinessError) => {
          resolve(false);
        })
      });
    }
    if (!isFirstPermission && !isAllowPermission) {
      //第一次以外申请，进行弹窗
      return new Promise((resolve) => {
        if (isShowPrompt) { //展示弹窗


          // THAlertView.confirm({
          //   title: promptTitle,
          //   message: promptContent,
          //   buttonType: this.buttonType,
          //   onClick: (index: number) => { //跳转到设置中
          //     if (index == 1) {
          //       THPermission.getInstance()
          //         .gotoPermissionSettingAsync(context, permissions)
          //         .then((data: Array<abilityAccessCtrl.GrantStatus>) => {
          //           //至少有一个权限同意了，则代表同意了了
          //           let isAllowPermission = THPermission.getInstance().checkPermissionsAllAllowed(permissions)
          //           resolve(isAllowPermission);
          //         })
          //         .catch(() => {
          //           resolve(false);
          //         })
          //     }
          //   }
          // })
        } else { //不弹窗 返回授权的结果
          resolve(isAllowPermission);
        }
      });
    }
    return new Promise((resolve) => {
      resolve(true);
    });
  }
}
