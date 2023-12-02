# Health++学生健康监测系统

欢迎使用Health++学生健康监测系统，一个基于 Ruby on Rails 框架构建的全功能学生健康管理平台。此系统使用 Ruby 进行开发，采用 Bootstrap 框架进行前端设计。

## 功能概览
学生健康监测系统旨在提供一个综合性的学生健康管理解决方案，涵盖了三个不同类型的用户：

1.学生用户：
- 学生用户可以方便地报告他们的健康状况。
- 可以查看医生的反馈，及时了解自身健康状况。

2.医生用户：
- 医生用户能够查看学生提交的健康报告，快速识别可能存在的问题。
- 提供实时反馈，与学生保持沟通，促进健康管理。

3.管理员用户：
- 管理员用户拥有全面的系统控制权限。
- 可以查看疾病统计数据，从而更好地了解学生群体的整体健康状况。
- 可以发布通知，确保学生和医生及时获得关键信息。

## 如何使用
1.学生用户
- 登录系统，进入个人仪表板。
- 在个人仪表板中，选择“报告健康状况”并填写相关信息。
- 查看医生的反馈，了解进一步的健康建议。

2.医生用户
- 登录系统，进入医生仪表板。
- 查看学生提交的健康报告，快速识别可能存在的问题。
- 提供实时反馈，与学生进行沟通。
  
3.管理员用户
- 登录系统，进入管理员控制面板。
- 查看系统中的疾病统计数据，以便制定更好的健康策略。
- 发布通知，确保全体用户获得及时信息。

## Figma原型展示
https://www.figma.com/file/Vye7jACxeTAQmUhgpgJsSh/student-monitor-system?type=design&node-id=136%3A586&mode=design&t=CGvVxV1Itq7o8kNR-1

## 数据库设计图
![IMG_1718](https://github.com/cyclic-group/student-health-monitor/assets/129709096/a353b7bc-ca1c-4fe5-83fd-8229db80fe8f)

## 模拟生产环境
https://hpp-student-health-monitor.herokuapp.com/

## 运行项目
确保你的系统已经安装 Ruby 和 Ruby on Rails。在项目根目录下运行以下命令：
```bash
bundle install
rails db:create
rails db:migrate
rails server
```
访问 http://localhost:3000 查看系统运行情况。

## 贡献者
感谢以下贡献者对项目的支持和贡献：
- cyclic-group
- Dewer

## 版权和许可
此项目采用[MIT许可证](https://chat.openai.com/c/LICENSE)。详细信息请参阅许可证文件。

--- 

如果您对该项目有任何建议或反馈，请随时联系我们。谢谢您的使用！

![image](https://github.com/cyclic-group/student-health-monitor/assets/129709096/605abca3-fc32-4535-a6de-9534bf7035af)
