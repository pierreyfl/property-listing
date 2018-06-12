var Articles = createReactClass({
    getInitialState: function() {
        return {
            articles: [],
            articleToEdit: {}
        };
    },
    componentDidMount: function () {
        this.reload();
    },
    showCreateForm: function () {
        var formData = {
            id: 0,
            title: '',
            content: '',

        }

        this.setState({
            articleToEdit: formData
        });
    },

    reload: function () {
        var vm = this;
        $.get('/admin/articles.json', function(response) {
            vm.setState({
                articles: response
            })
        })
    },
    handleSave: function(data) {
        //console.log(data);

        var vm = this;
        if (data.id) {
            $.ajax({
                url: '/admin/articles/' + data.id,
                type: 'PUT',
                data:  data,
                success: function(response) {
                    $('#myModal').modal('hide');
                    vm.reload();
                }
            });
        } else {
            $.ajax({
                url: '/admin/articles',
                type: 'POST',
                data:  data,
                success: function(response) {
                    $('#myModal').modal('hide');
                    vm.reload();
                }
            });
        }
    },

    handleEdit: function(data, event){
        var formData = {
            id: data.id,
            title: data.title,
            content: data.content,

        }


        this.setState({
            articleToEdit: formData
        })
    },
    handleDelete: function(data, event){
        var vm = this;
        if (confirm('Are you sure you want to delete this article?')) {
            $.ajax({
                url: '/admin/articles/' + data.id,
                type: 'DELETE',
                success: function() {
                    vm.reload();
                }
            });
        }
    },

    render: function() {
        return (
            <div>
                <h3>Admin articles</h3>
                <hr />
                <p>
                    <a href="#" onClick={this.showCreateForm} className="btn btn-primary" data-toggle="modal" data-target="#myModal">Create Article</a>
                </p>

                <ArticlesList
                    onEdit={this.handleEdit}
                    onDelete={this.handleDelete}
                    articles={this.state.articles} />


                <ArticleForm title="Create/Edit Article"
                             onSave={this.handleSave}
                             formData={this.state.articleToEdit} />
            </div>
        );
    }
});