# PhoenixBuilder

## 简介

> PhoenixBuilder 是专门为网易版租赁服设计的多功能结构生成工具，兼有服务器管理功能的可选的 Omega 模块。目前建筑方面支持的功能有欧几里得几何 · ACME文件之 ·BDP (BDump, bdx)· schematic（方块NBT数据丢弃）文件之 建筑生成，以及图像绘制。

注意：PhoenixBuilder 是<ruby>商业化<rp>（</rp><rt style="font-size:80%;">付费</rt><rp>）</rp></ruby>软件。

注意：本文档包含大量过时内容，建议参考源代码使用。

* 本文中除特殊说明之处外，所述之 FastBuilder 均代表 PhoenixBuilder 。<ruby><rp><br/>您的浏览器不支持ruby注音系统，所有ruby将以「形（音）」格式展示。</rp></ruby>

### 原理
FastBuilder 采用了全新的技术，不再受限于 Websocket，因此在速度，性能和稳定性等方面有了巨大提升，并且拥有极大的可扩展性。当前FastBuilder的核心基于Sandertv的[Gophertunnel](https://github.com/Sandertv/gophertunnel/) （Gophertunnel 自身以 MIT 协议开放源代码）。

### 源代码开放
PhoenixBuilder 客户端 **完整**代码已开源（包括验证系统客户端以及核心算法），源代码点击[此处](https://github.com/LNSSPsd/PhoenixBuilder)可见（AGPL v3 协议）。

但开放源代码并不意味着免费，您必须拥有 FastBuilder 账号才能使用它进入网易的服务器。

- 以 AGPL v3 协议发布代表着我们允许您对软件本体进行修改并进行再发布，且并不阻止商业行为。

### 注意事项（购买须知）

- 购买即代表您同意并且会遵守 FastBuilder [**用户协议**](enduser-license.html)
- 任何技术都是有**时效性**的，FastBuilder 可能随时会失效。FastBuilder 仅支持网易最新版本。
- 您购买的 FastBuilder 含页首所述之功能，未来可能会更新其他功能，现在也可能已经存在一些没有在此叙述的功能，但其可用性并不得到保障。
- FastBuilder 之部分安装、使用步骤需要一定的**计算机和数学知识**，并且安装教程默认您**具备**这些知识。
- FastBuilder 采用月额制+SLOT 制，具体参见用户中心商城。
- 请勿使用 PhoenixBuilder 来导入**未经授权的著作**，每一个建筑作者都靠自己的体力及脑力劳动在社区生存，如果您使用其他人的建筑作品并加以盈利，会对整个游戏环境带来破坏。同时，如果建筑的著作权人追究责任，您应当且必须履行，并且我们不应为此承担任何责任。
- 开发者不是客服，他们没有义务**解决**您在使用软件过程中遇到的各种小问题，更不会**亲自**指导您安装。如果您在使用软件的过程中遇到了 bug，可以前往 Issues 页面提交 Issue。
- **由于多语言设计十分繁琐，程序中可能出现不被翻译的内容**。 (如：选择中文出现部分英文/选择英文出现部分中文)
- 每个功能都尽量设计**完美**，但依然是存在**缺陷**的。

### <ruby>基本概念<rp>（</rp><rt style="font-size:80%;">世界观</rt><rp>）</rp></ruby>

FastBuilder Phoenix与其他程序的不同点在于，存在「客户端」与「服务端」概念。玩家正在运行的游戏与 FastBuilder Phoenix 同为**客户端**，而玩家所欲使用 FastBuilder 于之中的租赁服为**服务端**。
	
众所周知，客户端不一定都要在同一台设备上，所以即使您自己的游戏没有运行也能<ruby>使用<rp>（</rp><rt style="font-size:80%;">正常运行</rt><rp>）</rp></ruby>FastBuilder。
	
由于使用命令行操作，需要用户具备如下基础：

- 文件操作能力，能够理解路径和文件层级。
- 简单的英语能力，能够认出 "Error" · "Permission denied" · "Not found" 等系统提示之字眼并明白其含义。
- 能够区分全角符号与半角符号。
- (最好具有)在命令行界面输入并执行命令的能力。

请确保您具备以上能力，如果您不具备这样的条件仍执意购买 FastBuilder 导致<ruby>无法<rp>(</rp><rt style="font-size:80%">不会</rt><rp>)</rp></ruby>使用，开发组不承担任何责任，更不会提供帮助。

### 安装指导

#### 必要条件

- 拥有 FastBuilder 用户中心账户，也称为 FastBuilder 账户。

- 因设备而异：

  - 电脑端（Windows/Linux/macOS）：电脑需具备正常的网卡
- <ruby>安卓<rp>(</rp><rt style="font-size:80%;">Android</rt><rp>)</rp></ruby>:  拥有Termux, 安装步骤见下文
  - iOS: 设备<ruby>已越狱<rp>(</rp><rt style="font-size:80%;">Jailbroken</rt><rp>)</rp></ruby>且您了解终端的使用方法。（UI 版不保证可以正常工作）

- 勤劳的双手和善于思考的**大脑**

1. 登录 [FastBuilder 用户中心](https://uc.fastbuilder.pro) 
2. 进入 Profile 部分，设置<ruby>网易版用户名<rp>（</rp><rt style="font-size:80%;">游戏名</rt><rp>）</rp></ruby>
3. 设定您要使用Fast Builder的**租赁服**的号码（注意：该租赁服必须允许**任意等级**的玩家加入）
4. 进入【Profile】，设置辅助用户名称（英文），并点击【创建】来创建**辅助用户**
5. 进入【网易实名】部分，进行实名验证
6. 再次进入【Profile】，设置辅助用户的名称
7. 如果使用时显示【您已经被禁止登录游戏，如有问题请联系官方客服】，则表明辅助用户被封禁，届时请进入用户中心【网易实名】部分，点击丢弃辅助用户

以上是必要信息填写，接下来进入安装步骤，不同平台方案不同，请找到自己的平台：

#### 安装步骤

- Windows: 直接在用户中心的【Download】下载

- iOS: 从APT软件源 https://apt.boul.dev 直接安装。

- Linux (推荐使用此平台): 

  ```shell
  # 方法同样适用于iOS/macOS/Android等类unix
  # 可用于安装或更新
  bash -c "$(curl -fsSL https://storage.fastbuilder.pro/install.sh)"
  ```

- Android: 

  - a. [点此](https://f-droid.org/repo/com.termux_118.apk)下载 Termux （**0.118**）; 

  - b. 安装完成后，前往系统设置，给予Termux app**存储空间权限**且允许**无限制后台运行**。

  - c. 使用与 Linux 相同的步骤，下载 FastBuilder (x86 或 x86_64/amd64 架构的Android设备未来可能不被支持。)

- 图形界面版本：
  - 如果你实在不会使用命令行界面，你可以在[这里](https://storage.fastbuilder.pro/gui/):https://storage.fastbuilder.pro/gui/
  找到图形界面的版本，
  - 尽管如此，我们仍推荐使用命令行界面，因为图形界面往往缺少一些新特性
  - __如果你因"版本无效"无法使用图形界面登录到租赁服，请在界面右上角，点击齿轮图标->高级设置->选中禁用版本验证__
  - 即使是未越狱的ios，仍可以使用AltStore等方式安装 phoenixbuilder-ios-app.ipa
### 使用指导

FastBuilder Phoenix是~~纯命令行程序，没有复杂的GUI~~，这使得程序本身非常易于使用。

#### 启动步骤

- Windows: 双击FastBuilder可执行文件(**.exe**)

- Linux: 无需解释

- iOS/macOS: 进入终端，执行以下命令:

  ```shell
  fastbuilder
  ```

- Android: 打开Termux， 执行以下命令:

  ```shell
  fastbuilder
  ```

#### 初始化程序

如果不出意外，在您完成了上述步骤，并且看到了Fast Builder成功启动的字样。第一次启动会要求用户输入Fast Builder账号密码（密码不回显），照做即可。完成后，Fast Builder会要求用户输入<ruby>租赁服号码<rp>(</rp><rt style="font-size:80%;">Rental Server Number</rt><rp>)</rp></ruby>和租赁服密码（没有可忽略，不会回显）。如果没有报错退出，那么FastBuilder大概就成功启动了（第二次启动不会要求用户输入账号密码）。接下来，将其挂在后台，进入网易租赁服，若看到辅助用户在线，那么FastBuilder就成功运行了。这个时候，请**给予辅助用户OP权限**。 请在控制台输入FastBuilder命令，而非在游戏中，另外，我们也不推荐使用`get`命令，因为它将所有者的信息传入服务器后端，并可能导致封禁。

#### FastBuilder命令解析

FastBuilder采用类似Linux Shell的命令系统（并非原版Minecraft的命令），只需直接在Termux内输入。如果您是Linux爱好者,那您将会很快掌握FB的命令。

注意实际上「#」并不能在FastBuilder命令中作注释，此处只是为了叙述方便。

```shell
# 例子：生成半径为5,方向朝y轴的圆,以下两条命令是等价的
round -r 5 -f y -h 1
round --radius 5 --facing y --height 1
```

##### 生成器设置

成功初始化FB之后，我们将<ruby>辅助用户<rp>（</rp><rt style="font-size:80%;">Bot</rt><rp>）</rp></ruby>所在的维度称为一个*【空间】*，所有的操作都是在该空间中进行的。因此，如果您想在不同的【空间】中使用FB，您必须让Bot处于目标空间。
	
想要使用FB，必须设置【**空间**】的【**原点**】（**结构会在原点构造**），默认的原点在Bot进入游戏时所处的位置。
	
使用 `get` 命令可以修改原点设置为您当前所处的位置，下面是相关功能命令的详解。
	
FastBuilder Phoenix使用了**协程**，这意味这您可以一次执行多个任务，您可以使用`task`命令管理任务。

##### Task命令

task命令用于管理当前的【**任务**】（每个**建筑进程**都被抽象为一个任务）。每个task都有自己的runtime，您可以用一些功能命令设定任务的内部参数。task命令具有如下几个基本子命令（#后面为注释，解释了子命令的作用）：

````shell
tasktype <type:async|sync> # Task类型，sync不支持进度显示，一边计算一边发送数据，async则是完成计算后发送，支持速度显示
当使用async模式时，所有的构建指令都支持 -resume 百分比 参数，例如 bdump -p xx.bdx -resume 90 即为跳过前90%，只构建最后 10%
task list # 列出所有任务的ID，内容以及状态
task pause <taskID> # 暂停某个任务
task resume <taskID> # 恢复某个被暂停的任务
task break <taskID> # 销毁某个任务（不可恢复，它将在列表中消失）
````

task命令还可以设定任务执行延迟(Delay)以及发包方案(Delay Mode):

```shell
task setdelay <taskID> <delay> # 设定某个任务的发包延迟。在continuous模式下单位为微秒； 在discrete模式下单位为秒
task setdelaymode <taskID> <delayMode:continuous|discrete|none> # 设定某个任务的发包方案，有3个可选参数
task setdelaythreshold <taskID> <threshold:int> # 设定某个任务的阈值（最大方块集合），仅在 discrete 方案下有效
```

- continuous（连续）：以一定速度发包，不会突变，比较稳定。
- discrete（离散）：每经过一段固定时间发送大量数据包（最大数量不大于阈值），突变，不稳定，有概率造成服务器崩溃。
- none（无延迟）：持续发送大量数据包，不会突变，非常不稳定，很大可能造成服务器崩溃。

三种方法各有优缺点，请斟酌使用：
- 速度: continuous <= discrete < none (部分配置也可能导致continuous > discrete)
- 稳定性: continuous > discrete > none
- 平滑：continuous > none >= discrete 

##### 功能命令

- 设置空间原点/终点(终点并不一定是必要的)：

  ```shell
  set x y z
  setend x y z
  ```

- 设置全局指令执行延迟和执行方案：

  ```shell
  delay mode <delayMode:continuous|discrete|none> # 设定默认的发包方案
  delay threshold <threshold:int> # 设定默认阈值（最大方块集合），仅在 discrete 方案下有效
  delay set <Delay> # 设定默认的发包延迟。在continuous模式下单位为微秒； 在discrete模式下单位为秒
  ```

- 设置是否显示进度条（显示建筑的进度百分比，方块总数，瞬时速度等信息。默认为true）

  ```shell
  progress <value:bool>
  ```

* 从FastBuilder用户中心退出登录

  ```
  logout
  ```

* 重新选择语言偏好

  ```
  lang
  ```

* 打开FastBuilder控制菜单

  ```
  menu
  ```

  

##### 几何命令

FastBuilder具备在空间中构造简单几何体的功能（如圆,圈,球,线,椭圆等）
- 圆面/圈 : 
  ```shell
  round/circle -r <radius> -f <facing> -h <height> -b <tileName> -d <data>
  -r --radius 圆或圈的半径
  -f --facing 朝向,可选值有x,y,z
  -b --block 方块名称
  -d --data 方块特殊值
  ```

- 球:
  ```shell
  sphere -r <radius> -s <shape>
  -s --shape hollow(空心) |solid(实心)
  ```

- 椭圆: 

  ```shell
  ellipse -l <length> -w <width> -f <facing>
  -l --length 长度
  -w --width 宽度
  ```

- 椭球: 

  ```shell
  ellipsoid -l <length> -w <width> -h <height>
  ```

##### 建筑生成命令

从`schematic` · <ruby><rb><code>bdx</code></rb><rp>(</rp><rt style="font-size:80%">bdump</rt><rp>)</rp></ruby>或`mcacblock`（ACME导出的建筑文件）文件中加载建筑：

- -p --path 文件路径

  ```shell
  schem -p <filePath>
  acme -p <filePath>
  bdump -p <filePath>
  -p --path 文件路径，暂时不支持存在空格的文件名。
  # 可选Flags:
  # --excludecommands : 不导入命令方块中的命令。
  # --invalidatecommands : 无效化处理导入的命令方块中的命令，如命令"say 123"会被处理为"|say 123"
  # -S --strict: 如果文件未签名或未能验证签名则不进行建筑。
  ```

##### 像素画生成

- 将图片加载到空间：

  ```shell
  plot -p <imageFilePath> -f <facing>
  ```

##### 实验性功能：建筑导出

**注意：本功能并不稳定，使用期间可能出现各种预期外情况（如程序崩溃）。另外，建筑导出后生成的文件可能无效，所以请在导出后检查。**

* 设置导出的第一点（起点）

  ```shell
  get
  set x y z
  ```

  或

  ```shell
  get begin
  ```

  * 二者等效

* 设置导出第二点（终点）

  ```shell
  get end
  setend x y z
  ```

* 导出指定区域的建筑到文件

  ```shell
  export -p <filePath>
  # 可选Flag： --excludecommands : 不导出命令方块中的命令。
  ```

* 用`bdump`命令对其进行导入操作。

##### ~~世界聊天~~

~~世界聊天可以让您与其他在线的FastBuilder用户聊天，您可以在用户中心开启/关闭它。用法如下:~~

```shell
> 消息
> 匿名消息
```

##### 命令执行

你可以在Termux使用【.】执行MC原版命令，终端可以获取返回值。例如：

```ruby
.tp 5 5 5
.list
.kill @a
```

而【!】可以执行websocket命令，例如：

```shell
!querytarget @s
```
