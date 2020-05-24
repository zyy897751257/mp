var app = new Vue({
    el: "#app",
    data: {
        pages:15,
        pageNo:1,
        list:[],
        entity:{},
        ids:[],
        searchEntity:{
            status:''
        },
        dialogFormVisible: false,
        formLabelWidth: '75px',
        multipleSelection: [],
        statusList:[
            {label:"禁用",value:'0'},
            {label:"启用",value:'1'},
            {label:"全选",value:''}
        ],
        statusList1:[
            {label:"禁用",value:0},
            {label:"启用",value:1}
        ],
        ifUpdate: false,
        orgForm: {

        },
        orgEntity: {

        },
        rules: {
            orgCode: [
                { required: true, message: '机构代码不能为空', trigger: 'blur' }
            ],
            orgName: [
                { required: true, message: '机构名称不能为空', trigger: 'blur' }
            ]
        }

    },
    methods: {
        submitForm(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    alert('submit!');
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
        },
        resetForm(formName) {
            this.$refs[formName].resetFields();
        },
        updateStatus:function (status,id) {
            if (id != null) {
                this.ids.push(id)
            }
            axios.post("/org/updateOrgStatus?status="+status, this.ids).then(function (response) {
                if (response.data.flag) {
                    //app.searchList(1)
                    app.findAll()
                    app.ids = []
                }
            })
        },
        handleSelectionChange(val) {
            this.multipleSelection = val;
            this.ids = []
            if (this.multipleSelection != null) {
                for (var i = 0;i<this.multipleSelection.length;i++) {
                    this.ids.push(this.multipleSelection[i].id)
                }
            }
            console.log(this.ids)
        },
        //上传之前进行文件格式校验
        beforeUpload(file){
            const isXLS = file.type === 'application/vnd.ms-excel';
            if(isXLS){
                return true;
            }
            const isXLSX = file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
            if (isXLSX) {
                return true;
            }
            this.$message.error('上传文件只能是xls或者xlsx格式!');
            return false;
        },
        //下载模板文件（路径）
        downloadTemplate(){
            window.location.href="../template/Template_TbBrand.xlsx";
        },
        //上传成功提示
        handleSuccess(response, file) {
            if(response.success){
                this.$message({
                    message: response.message,
                    type: 'success'
                });
                app.searchList(1);
            }else{
                this.$message.error(response.message);
            }
            console.log(response, file);
        },
        searchList:function (curPage) {
            console.log(this.searchEntity)
            axios.post('/org/search?pageNo='+curPage,this.searchEntity).then(function (response) {
                //获取数据
                app.list=response.data.list;

                //当前页
                app.pageNo=curPage;
                //总页数
                app.pages=response.data.pages;
            });
        },
        //查询所有机构
        findAll:function () {
            console.log(app);
            axios.get('/org/findAll').then(function (response) {
                console.log(response);
                //注意：this 在axios中就不再是 vue实例了。
                app.list=response.data.data;

            }).catch(function (error) {

            })
        },
         findPage:function () {
            var that = this;
            axios.get('/org/findPage',{params:{
                pageNo:this.pageNo
            }}).then(function (response) {
                console.log(app);
                //注意：this 在axios中就不再是 vue实例了。
                app.list=response.data.list;
                app.pageNo=curPage;
                //总页数
                app.pages=response.data.pages;
            }).catch(function (error) {

            })
        },
        add:function () {
            axios.post('/org/add',this.orgForm).then(function (response) {
                console.log(response);
                if(response.data.flag){
                    //app.searchList(app.pageNo)
                    app.findOne(app.orgEntity.orgCode)
                }
            }).catch(function (error) {
                console.log("1231312131321");
            });
        },
        update:function () {
            axios.post('/org/update',this.orgForm).then(function (response) {
                /*console.log(response);*/
                if(response.data.flag){
                    window.location.reload()
                }
            }).catch(function (error) {
                console.log("1231312131321");
            });
        },
        save:function () {
            if(this.orgForm.id!=null){
                this.update();
            }else{
                this.add();
            }
        },
        findOne:function (orgCode) {
            axios.get('/org/findOne/'+orgCode).then(function (response) {
                if (app.ifUpdate) {
                    //修改
                    app.orgForm = response.data.data;
                    console.log(app.orgForm)
                } else {
                    //点击查看详情
                    app.orgEntity = response.data.data;
                    console.log(app.orgEntity)
                }

            }).catch(function (error) {
                console.log("1231312131321");
            });
        },
        dele:function () {
            axios.post('/brand/delete.shtml',this.ids).then(function (response) {
                console.log(response);
                if(response.data.success){
                    app.searchList(app.pageNo);
                }
            }).catch(function (error) {
                console.log("1231312131321");
            });
        }



    },
    //钩子函数 初始化了事件和
    created: function () {
        //this.findAll();

        let params = this.getUrlParam();
        let orgCode = params.orgCode
        this.findOne(orgCode,false)
    }

})
