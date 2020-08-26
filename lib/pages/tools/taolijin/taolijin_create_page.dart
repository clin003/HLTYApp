import 'package:app/apifetch/taobao.tbk.dg.vegas.tlj.create.api.dart';
import 'package:app/apifetch/taobao.tbk.tpwd.create_api.dart';
import 'package:app/application.dart';
import 'package:app/models/openapi_response.dart';
import 'package:app/models/taobao.tbk.dg.vegas.tlj.create.entity.dart';
import 'package:app/utils/app_size.dart';
import 'package:app/utils/log_util.dart';
import 'package:app/utils/number_utils.dart';
import 'package:app/widgets/widget_lite.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ToolsTaolijinCreatePage extends StatefulWidget {
  final String id;
  final String title;
  final String quanEndPrice;
  final String tbkCommission;
  final String quanId;
  ToolsTaolijinCreatePage(
      {this.id = '',
      this.title = '淘礼金来啦',
      this.quanEndPrice = '',
      this.tbkCommission = '',
      this.quanId = ''});
  @override
  _ToolsTaolijinCreatePageState createState() =>
      _ToolsTaolijinCreatePageState();
}

class _ToolsTaolijinCreatePageState extends State<ToolsTaolijinCreatePage> {
  TextEditingController _resultController = TextEditingController();

  TextEditingController _itemIdController = TextEditingController();
  TextEditingController _totalNumController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _perFaceController = TextEditingController();
  TextEditingController _sendStartTimeController = TextEditingController();
  TextEditingController _sendEndTimeController = TextEditingController();
  TextEditingController _useEndTimeModeController = TextEditingController();
  TextEditingController _useEndTimeController = TextEditingController();
  TextEditingController _useStartTimeController = TextEditingController();

  GlobalKey _formKey = new GlobalKey<FormState>();

  String _useEndTimeHint = '';
  String _useStartTimeHint = '';
  String _perFaceHint = '';
  bool _isExpanded = false;
  double _yongjin = 0.0;

  String _taolijinUrl = '';
  String _taokouling = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    if (mounted) {
      _yongjin = double.parse(widget.quanEndPrice) *
          double.parse(widget.tbkCommission) *
          0.9 /
          10000;
//      _yongjin.roundToDouble();

      setState(() {
        _itemIdController.text = widget.id;
        _nameController.text = widget.title;
        _perFaceHint = (_yongjin > 0)
            ? ',参考(${NumberUtils.formatDoubleNum(_yongjin, 2)}(${widget.quanEndPrice}*${double.parse(widget.tbkCommission) / 100}*0.9))'
            : '';
      });
      LogUtil.v(
          '参考佣金：(${NumberUtils.formatDoubleNum(_yongjin, 2)}(${widget.quanEndPrice}*${double.parse(widget.tbkCommission) / 100}*0.9))');
    }
  }

  void _createTaolijin() async {
    OpenAPIResponseModel entity1 = await TbkDgVegasTljCreateRequestEx.fetch(
//      adzone_id: '$_adzoneId',
      item_id: _itemIdController.text,
      total_num: _totalNumController.text,
      name: _nameController.text,
      per_face: _perFaceController.text,
      send_start_time: _sendStartTimeController.text,
      send_end_time: _sendEndTimeController.text,
      use_end_time: _useEndTimeController.text,
      use_end_time_mode: _useEndTimeModeController.text,
      use_start_time: _useStartTimeController.text,
//      appkey: '$_appkey',
//      appsecret: '$_appsecret',
    );
    if (entity1?.code != null && entity1.code == 0) {
      _taolijinUrl = entity1.data;
//      生成淘口令
      OpenAPIResponseModel entity2 =
          await TbkTpwdCreateRequestAPI.fetch(_taolijinUrl);
      if (entity2?.code != null && entity2.code == 0) {
        _taokouling = entity2.data;
      }
      if (_perFaceController.text.isEmpty) {
        if (mounted) {
          setState(() {
            _resultController.text = '${widget.title}\n'
//                '$_taolijinUrl\n'
                '$_taokouling';
          });
        }
      } else {
        double _fulijia = double.parse(widget.quanEndPrice) -
            double.parse(_perFaceController.text ?? "1");
        if (mounted) {
          setState(() {
            _resultController.text = '${widget.title}\n'
                '福利价：¥$_fulijia元\n'
//                '$_taolijinUrl\n'
                '$_taokouling';
          });
        }
      }
    } else if (entity1?.message != null && entity1.message != "") {
      bool _banChickUrl= Application.sp.getBool("banChickUrl")??false;
      if (_banChickUrl){
        buildshowDialog(
            context,
                '生成失败(更换商品)或检查：玩法钱包是否有余额，可生成商品数量是否达到上限！'
                    '以及是否已配置完整的openAPI信息。');
      }else{
        buildshowDialog(
            context,
            '${entity1.message}'
                '生成失败，请检查：玩法钱包是否有余额，pid是否配置正确，可生成商品数量达到上限！');
      }

    }
  }

  Widget _buildResult() {
    return FDottedLine(
//      width: AppSize.width(200),
//      height: AppSize.height(100),
      child: Column(
        children: [
          TextField(
            controller: _resultController,
            maxLines: 3,
//            enabled: false,
            decoration: InputDecoration(
              labelText: '生成结果:',
            ),
          ),
          _buildFormCopyButton(),
        ],
      ),
    );
  }

  Widget _buildFormCopyButton() {
    return Row(
      children: [
        Expanded(
          child: OutlineButton(
            padding: EdgeInsets.all(10.0),
            child: Text('一键复制'),
            onPressed: () {
              Clipboard.setData(
                  ClipboardData(text: '${_resultController.text}'));
//              _resultController.text = "复制内容";
              buildshowDialog(context, '已复制：${_resultController.text}');
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFormCreateButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Row(
        children: [
          Expanded(
            child: OutlineButton(
              padding: EdgeInsets.all(15.0),
              child: Text("生成淘礼金"),
              onPressed: () {
                if ((_formKey.currentState as FormState).validate()) {
                  _createTaolijin();
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> mainInfo = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        '淘礼金生成工具',
        style: TextStyle(fontSize: AppSize.sp(33.0)),
      )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _itemIdController,
                  decoration: InputDecoration(
                    labelText: "宝贝id：",
                    hintText: "淘宝商品id",
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "商品id不能为空";
                  },
                ),
                TextFormField(
                  controller: _totalNumController,
                  decoration: InputDecoration(
                    labelText: "礼金数量：",
                    hintText: "淘礼金总个数",
                  ),
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "淘礼金名称：",
                    hintText: "淘礼金名称，最大10个字，最少5个字",
                  ),
                  validator: (v) {
                    return v.trim().length < 10 ? null : "红包名称长度必须小于等于10";
                  },
                ),
                TextFormField(
                  controller: _perFaceController,
                  decoration: InputDecoration(
                    labelText: "淘礼金面额：",
                    hintText: "最低1元$_perFaceHint",
                  ),
                ),
                ExpansionPanelList(
                  children: <ExpansionPanel>[
                    ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(title: Text('更多设置(可选项)'));
                      },
                      body: Padding(
                        padding: EdgeInsets.fromLTRB(15.0, 0, 15, 15),
                        child: ListBody(
                          children: <Widget>[
                            TextFormField(
                              controller: _sendStartTimeController,
                              decoration: InputDecoration(
                                labelText: "发放开始时间：",
                                hintText: "格式:2018-09-01 00:00:00",
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            TextFormField(
                              controller: _sendEndTimeController,
                              decoration: InputDecoration(
                                labelText: "发放截止时间：",
                                hintText: "格式:2018-09-01 00:00:00",
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                            TextFormField(
                              controller: _useEndTimeModeController,
                              decoration: InputDecoration(
                                labelText: "结束日期的模式：",
                                hintText: "1:相对时间，2:绝对时间",
                              ),
                              onChanged: (v) {
                                if (v == '1') {
                                  setState(() {
                                    _useStartTimeHint = '相对时间，无需填写';
                                    _useEndTimeHint =
                                        '相对时间，时间格式为1-7直接的整数, 例如，1（相对领取时间1天）';
                                  });
                                } else if (v == '2') {
                                  setState(() {
                                    _useStartTimeHint =
                                        '绝对时间，格式 yyyy-MM-dd，例如，2019-01-29，表示从2019-01-29 00:00:00 开始';
                                    _useEndTimeHint =
                                        '绝对时间，格式为yyyy-MM-dd，例如，2019-01-29，表示到2019-01-29 23:59:59结束';
                                  });
                                }
                              },
                            ),
                            TextFormField(
                              controller: _useEndTimeController,
                              decoration: InputDecoration(
                                labelText: "使用结束日期：",
                                hintText: "$_useEndTimeHint",
                              ),
                            ),
                            TextFormField(
                              controller: _useStartTimeController,
                              decoration: InputDecoration(
                                labelText: "使用开始日期：",
                                hintText: "$_useStartTimeHint",
                              ),
                            ),
                          ],
                        ),
                      ),
                      isExpanded: _isExpanded,
                      canTapOnHeader: true,
                    ),
                  ],
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      _isExpanded = !isExpanded;
                    });
                  },
                ),
                _buildFormCreateButton(),
                _buildResult(),
//                  _buildFormCopyButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
