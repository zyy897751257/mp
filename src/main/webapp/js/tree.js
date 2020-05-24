Vue.component('item', {
    template: '#treeTemplate',
    props: ['tree'],
    methods: {
        toggle: function(i) {
            this.tree[i].open = !this.tree[i].open;
            console.log(this.tree[i].open)
            this.$set(this.tree, i, this.tree[i]);
        },
        isFolder: function(data) {
            return data.child && data.child.length
        },
        changeCheck(i) {
            var that = this;
            console.log(that.tree)
        }

    }
});
var vm = new Vue({
    el: '#vm',
    data: {
        treeData: [],
        name: "",
    },
    mounted() {
        var that = this;
        // 异步获取 数据
        that.treeAjax();
    },
    methods: {
        treeAjax() {
            var that = this;
             var url = '/menu/getMenusByParentId/' + 0
             $.ajax({
                 type: "get",
                 url: url,
                 dataType: "json",
                 success: function(res) {
                     that.treeData = res.data;
                     console.log(that.treeData)
                 }
             });
        },

    },
    created: function() {
        function _addOpen(data) {
            for (var i = 0; i < data.length; i++) {
                data[i]['open'] = false;
                if (data[i].child.length > 0) {
                    _addOpen(data[i].child);
                }
            }
        }
        _addOpen(this.treeData);

    }
});