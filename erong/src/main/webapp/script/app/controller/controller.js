/**
 * Created by Administrator on 2015/5/26.
 */
var app=angular.module('app',[]);

app.controller('common',function($scope){
    $scope.name="生钱树投资理财平台";
    $scope.title='生钱树_安全、专业、稳健的财富增值服务平台';
    $scope.description='生钱树-安全、专业、稳健的财富增值服务平台';
    $scope.keywords="P2B,个人增值,投资,企业融资,理财";
});

app.controller('summary',function($scope){
    $scope.amount= $.formatMoney(3040000,2);
    $scope.entrynum=468;
})

app.controller('p2pList',function($scope){
    $scope.items=[
        {text:'e融安稳融资项目',id:'TY20150002',income:'6.00',scale:'200.00',dateline:180,image:'back_logo_03.gif',status:1,min:1000,progress:50},
        {text:'e融安稳融资项目',id:'TY20150003',income:'7.00',scale:'300.00',dateline:180,image:'back_logo_03.gif',status:1,min:1000},
        {text:'e融安稳融资项目',id:'TY20150004',income:'8.00',scale:'200.00',dateline:180,image:'back_logo_03.gif',status:1,min:1000},
        {text:'e融安稳融资项目',id:'TY20150005',income:'10.00',scale:'200.00',dateline:180,image:'back_logo_03.gif',status:1,min:1000},
        {text:'e融安稳融资项目',id:'TY20150006',income:'7.00',scale:'200.00',dateline:180,image:'back_logo_03.gif',status:1,min:1000},
        {text:'e融安稳融资项目',id:'TY20150007',income:'7.00',scale:'200.00',dateline:180,image:'back_logo_03.gif',status:1,min:1000},
        {text:'e融安稳融资项目',id:'TY20150008',income:'7.00',scale:'200.00',dateline:180,image:'back_logo_03.gif',status:1,min:1000},
        {text:'e融安稳融资项目',id:'TY20150009',income:'7.00',scale:'200.00',dateline:180,image:'back_logo_03.gif',status:1,min:1000},
        {text:'e融安稳融资项目',id:'TY20150010',income:'7.00',scale:'200.00',dateline:180,image:'back_logo_03.gif',status:1,min:1000}
    ];
});