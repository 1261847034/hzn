# 注册、登录
## 注册
### HTTP Request

`POST /api/members/register`

### URL Parameters
字段名 | 是否必填 | 描述
--------- | ------- | -----------
Phone | true | 手机号
Password | true | 密码
Province | true | 省
City | true | 市
County | true | 区
Roles | true | 角色(1: 货主, 2: 承运人)

> 返回数据

```json
{
    "Status": 1,
    "Data": {
        "MemberID": 2,
        "Name": "李宁",
        "Sex": null,
        "HeadIcon": null,
        "Tel": null,
        "Password": "88888888",
        "Province": "湖南省",
        "City": "长沙市",
        "County": "长沙县",
        "CountyID": null,
        "Address": null,
        "Balance": "0.0",
        "Frozen": 0,
        "CreateTime": "2017-09-21T00:53:29.027+08:00",
        "Birthday": null,
        "Credit": 0,
        "IsDisable": null,
        "Phone": "13974958692",
        "Roles": "driver",
        "Authentication": "authorized",
        "AuthentRoles": "business_driver",
        "BJZ": "0.0",
        "Reason": null,
        "PayPWD": null
    }
}
```

## 登录
### HTTP Request

`POST /api/members/login`

### URL Parameters
字段名 | 是否必填 | 描述
--------- | ------- | -----------
Phone | true | 手机号
Password | true | 密码

> 返回数据

```json
{
    "Status": 1,
    "Data": {
        "MemberID": 2,
        "Name": "李宁",
        "Sex": null,
        "HeadIcon": null,
        "Tel": null,
        "Password": "88888888",
        "Province": "湖南省",
        "City": "长沙市",
        "County": "长沙县",
        "CountyID": null,
        "Address": null,
        "Balance": "0.0",
        "Frozen": 0,
        "CreateTime": "2017-09-21T00:53:29.027+08:00",
        "Birthday": null,
        "Credit": 0,
        "IsDisable": null,
        "Phone": "13974958692",
        "Roles": "driver",
        "Authentication": "authorized",
        "AuthentRoles": "business_driver",
        "BJZ": "0.0",
        "Reason": null,
        "PayPWD": null
    }
}
```