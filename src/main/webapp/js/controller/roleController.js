var app = new Vue({
    el: "#app",
    data: {
        pages:15,
        pageNo:1,
        list:[],
        entity:{},
        ids:[],
        searchEntity:{},
        dialogFormVisible: false,
        formLabelWidth: '120px',
        multipleSelection: [],
        defaultProps: {
            children: 'child',
            label: 'name'
        },
        menuData:[]
    },
    methods: {
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
        searchList:function (curPage) {
            axios.post('/role/search?pageNo='+curPage,this.searchEntity).then(function (response) {
                //获取数据
                if (response.data.flag) {
                    app.list=response.data.data.list;
                }
                //当前页
                app.pageNo=curPage;
                //总页数
                app.pages=response.data.data.pages;
            });
        },
        findAll:function () {
            console.log(app);
            axios.get('/role/findAll').then(function (response) {
                console.log(response);
                //注意：this 在axios中就不再是 vue实例了。
                app.list=response.data;

            }).catch(function (error) {

            })
        },
         findPage:function () {
            var that = this;
            axios.get('/role/findPage',{params:{
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
        //该方法只要不在生命周期的
        add:function () {
            axios.post('/role/add',this.entity).then(function (response) {
                console.log(response);
                if(response.data.success){
                    app.searchList(app.pageNo)
                }
            }).catch(function (error) {
                console.log("1231312131321");
            });
        },
        update:function () {
            axios.post('/role/update',this.entity).then(function (response) {
                /*console.log(response);*/
                if(response.data.success){
                    window.location.reload()
                }
            }).catch(function (error) {
                console.log("1231312131321");
            });
        },
        save:function () {
            if(this.entity.id!=null){
                this.update();
            }else{
                this.add();
            }
        },
        findOne:function (id) {
            axios.get('/role/findOne/'+id).then(function (response) {
                app.entity=response.data;
                console.log(app.entity)
            }).catch(function (error) {
                console.log("1231312131321");
            });
        },
        dele:function () {
            axios.post('/role/delete',this.ids).then(function (response) {
                console.log(response);
                if(response.data.success){
                    app.searchList(app.pageNo);
                }
            }).catch(function (error) {
                console.log("1231312131321");
            });
        },
        getAllMenu() {
            var url = '/menu/getMenusByParentId/' + 0
            $.ajax({
                type: "get",
                url: url,
                dataType: "json",
                success: function(res) {
                    app.menuData = res.data;
                    console.log(app.menuData)
                }
            });
        }



    },
    //钩子函数 初始化了事件和
    created: function () {
      
        this.searchList(1);

        this.getAllMenu()
    }

})
