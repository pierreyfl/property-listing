var ClassfiedLists = createReactClass({
    getInitialState: function() {
        return {
            lists: [],
            listToEdit: {}

        };
    },
    componentDidMount: function () {
        this.reload();
    },
    showCreateForm: function () {
        var formData = {
            id: 0,
            title: '',
            price: '',
            time_length: ''
        }

        this.setState({
            listToEdit: formData
        });
    },

    reload: function () {
        var vm = this;
        $.get('/admin/classfied_lists.json', function(response) {
            vm.setState({
                lists: response
            })
        })
    },

    handleSave: function(data) {
        //console.log(data);

        var vm = this;
        if (data.id) {
            $.ajax({
                url: '/admin/classfied_lists/' + data.id,
                type: 'PUT',
                data:  data,
                success: function(response) {
                    $('#myModal').modal('hide');
                    vm.reload();
                }
            });
        } else {
            $.ajax({
                url: '/admin/classfied_lists',
                type: 'POST',
                data:  data,
                success: function() {
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
            price: data.price,
            time_length: data.time_length
        }


        this.setState({
            listToEdit: formData
        })
    },
    handleDelete: function(data, event){
        var vm = this;
        if (confirm('Are you sure you want to delete this list?')) {
            $.ajax({
                url: '/admin/classfied_lists/' + data.id,
                type: 'DELETE',
                success: function() {
                    vm.reload();
                }
            });
        }
    },
    render: function () {
        return(

            <div>
            <h3>Admin Classified Lists</h3>
        <hr />
        <p>
        <a href="#" onClick={this.showCreateForm} className="btn btn-primary" data-toggle="modal" data-target="#myModal">Create List</a>
        </p>

        <ClassifiedListTable
        onEdit={this.handleEdit}
        onDelete={this.handleDelete}
        packages={this.state.lists} />


        <ListForm title="Create/Edit List"
        onSave={this.handleSave}
        formData={this.state.listToEdit} />
        </div>
        )
    }
})