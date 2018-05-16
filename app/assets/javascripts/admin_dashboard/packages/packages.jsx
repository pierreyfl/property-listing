var Packages = createReactClass({
    getInitialState: function() {
        return {
            packages: [],
            packageToEdit: {}
            
        };
    },
    componentDidMount: function () {
       this.reload();
    },
    showCreateForm: function () {
        var formData = {
            id: 0,
            name: '',
            price: '',
            listing_period: '',
            listings_amount: '',
            type: 'standard',
            single_multi: 'single'
        }

        this.setState({
            packageToEdit: formData
        });
    },

    reload: function () {
        var vm = this;
        $.get('/admin/packages.json', function(response) {
            vm.setState({
                packages: response
            })
        })
    },
    handleSave: function(data) {
        //console.log(data);

        var vm = this;
        if (data.id) {
            $.ajax({
                url: '/admin/packages/' + data.id,
                type: 'PUT',
                data:  data,
                success: function(response) {
                    $('#myModal').modal('hide');
                    vm.reload();
                }
            });
        } else {
            $.ajax({
                url: '/admin/packages',
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
            name: data.name,
            price: data.price,
            listing_period: data.listing_period,
            listings_amount: data.listings_amount,
            type: 'standard',
            single_multi: 'single'
        }

        if (data.is_premium) formData.type = 'premium';
        if (data.is_feature) formData.type = 'featured';
        if (data.is_multi) formData.single_multi = 'multi';

        this.setState({
            packageToEdit: formData
        })
    },
    handleDelete: function(data, event){
        var vm = this;
        if (confirm('Are you sure you want to delete this package?')) {
            $.ajax({
                url: '/admin/packages/' + data.id,
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
               <h3>Admin packages</h3> 
               <hr />
               <p>
                  <a href="#" onClick={this.showCreateForm} className="btn btn-primary" data-toggle="modal" data-target="#myModal">Create Package</a>
               </p>
               
               <PackagesList
                   onEdit={this.handleEdit}
                   onDelete={this.handleDelete}
                packages={this.state.packages} />
               
                
                <PackageForm title="Create/Edit Package"
                             onSave={this.handleSave}
                formData={this.state.packageToEdit} />
          </div>
        );
    }
});