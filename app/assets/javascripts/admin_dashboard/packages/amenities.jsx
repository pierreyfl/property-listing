var Amenities = createReactClass({

    getInitialState: function() {
        return {
            amenities: [],
            currentEdit: {},
            newItem: {
                name: '',
                available: true
            },
            package: {}
        }
    },
    componentWillReceiveProps: function (p) {
        this.setState(
            {
            package: p.package,
            packageId: p.package.id
            });
        if (p.package.id) this.reload(p.package.id);

        console.log(p)
        console.log(this.state)

    },
    onNewItemChange: function(event) {

        this.setState({
            newItem: Object.assign({}, this.state.newItem, {
                [event.target.name]: event.target.value
            })

        });
    },
    onEditItemChange: function(event) {

        this.setState({
            currentEdit: Object.assign({}, this.state.currentEdit, {
                [event.target.name]: event.target.value
            })

        });
    },
    onNewItemAvailableChange: function () {
        this.setState({
            newItem: Object.assign({}, this.state.newItem, {
                available: !this.state.newItem.available
            })

        });
    },

    onEditItemAvailableChange: function () {
        this.setState({
            currentEdit: Object.assign({}, this.state.currentEdit, {
                available: !this.state.currentEdit.available
            })

        });
    },
    handleEdit: function (a, e) {
        this.setState({
            currentEdit: Object.assign({}, this.state.currentEdit, a)
        });

    },
    cancelEdit: function (a, e) {
        this.setState({
            currentEdit: {}
        });

    },

    createItem: function () {
        var vm = this;
        if (!this.state.newItem.name) {
            alert('Please enter name');
            return;
        }
        $.ajax({
            url: '/admin/packages/' + this.state.package.id + '/amenities',
            type: 'POST',
            data:  this.state.newItem,
            success: function(response) {
                vm.state.newItem = {available: true, name: ''}
                vm.reload(vm.state.package.id);
            }
        });

    },
    updateItem: function () {
        var vm = this;
        if (!this.state.currentEdit.name) {
            alert('Please enter name');
            return;
        }
        $.ajax({
            url: '/admin/packages/' + this.state.package.id + '/amenities/' + this.state.currentEdit.id,
            type: 'PUT',
            data:  this.state.currentEdit,
            success: function() {
                vm.state.currentEdit = {}
                vm.reload(vm.state.package.id);
            }
        });

    },
    reload: function (id) {
        var vm = this;
        $.get('/admin/packages/' + id + '/amenities', function(response){
            vm.setState({
                amenities: response
            });
        })
    },
    handleDelete: function(data, event){
        var vm = this;
        if (confirm('Are you sure you want to delete this item?')) {
            $.ajax({
                url: '/admin/packages/' + vm.state.package.id + '/amenities/' + data.id,
                type: 'DELETE',
                success: function() {
                    vm.reload(vm.state.package.id);
                }
            });
        }
    },
    render: function(){
        var vm = this;
        var rows = this.state.amenities.map(function(p){
            var mark = (p.available) ? <span className="fa fa-check" /> : <span className="fa fa-times" />
            var available = (p.id === vm.state.currentEdit.id) ?
                <label> <input name="available" checked={vm.state.currentEdit.available} onClick={vm.onEditItemAvailableChange} type="checkbox"/> </label>
                : mark;
            return (
                <tr key={p.id}>
                    <td>
                        {p.id === vm.state.currentEdit.id ? <input name="name" value={vm.state.currentEdit.name} onChange={vm.onEditItemChange} /> : p.name}

                    </td>
                    <td>
                        {available}
                    </td>
                    <td className="actions">
                        {
                            p.id === vm.state.currentEdit.id ? (
                                <span>
                                    <a href="javascript:void(0)" title="Save" onClick={vm.updateItem}><i className="fa fa-save text-primary"></i></a>
                                    <a href="javascript:void(0)" title="Cancel" onClick={vm.cancelEdit}><i className="fa fa-reply text-default"></i></a>
                                </span>
                                ) : (
                                <span>
                                    <a href="javascript:void(0)" onClick={vm.handleEdit.bind(null, p)} title="Edit" ><i className="fa fa-edit"></i></a>
                                    <a href="javascript:void(0)" onClick={vm.handleDelete.bind(null, p)} title="Delete"><i className="fa fa-trash-o text-danger"></i></a>

                                </span>

                            )
                        }

                    </td>
                </tr>
            );
        });

        return (
        <div className="modal fade" id="AmenitiesModal" role="dialog" aria-labelledby="mymodallabel">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <button type="button" className="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 className="modal-title" id="myModalLabel">
                    {this.state.package.name} amenities + {this.state.package.id}
                </h4>
              </div>
              <div className="modal-body">
                  <table className="table">
                      <tbody>
                      <tr>
                          <th>Name</th>
                          <th>Available</th>

                          <th></th>
                      </tr>

                      {rows}

                      </tbody>
                      <tfoot>
                      <tr>
                          <th>
                              <input type="text" onChange={this.onNewItemChange} name="name" value={this.state.newItem.name} className="form-control" placeholder="Add new amenity"/>
                          </th>
                          <th>
                              <label> <input name="available" onClick={this.onNewItemAvailableChange} checked={this.state.newItem.available} type="checkbox"/> Available</label>

                          </th>

                          <th>
                              <button onClick={this.createItem}>
                                  <i className="fa fa-plus"></i> ADD
                              </button>
                          </th>
                      </tr>
                      </tfoot>
                  </table>


              </div>
              <div className="modal-footer">
                <button type="button"  className="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
    );
        
    }
});