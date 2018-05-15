var Packages = createReactClass({
    getInitialState: function() {
        return {
            packages: [
                {name:'react pack 1', price: 25, period: 7, id: 1},
                {name:'react pack 2', price: 25, period: 8, id: 2},
                {name:'react pack 3', price: 25, period: 9, id: 3},
                {name:'react pack 4', price: 25, period: 15, id: 4},
                {name:'react pack 5', price: 25, period: 30, id: 5},
                ],
            packageToEdit: {}
            
        };
    },
    
    componentDidMount: function () {
        var vm = this;
        $.get('/admin/packages.json', function(response) {
            vm.setState({
                packages: response
            })
        })
    },
    
    handleCreate: function(data) {
        console.log(data);
    },
    
    handleEdit: function(data, event){
        console.log(data);
        console.log(event);
        this.setState({
            packageToEdit: data
        })
    },
    
    render: function() {
        //var Button = ReactBootstrap.Button;
        
        
        return (
            <div>
               <h3>Admin packages</h3> 
               <hr />
               <p>
                  <a href="#" className="btn btn-primary" data-toggle="modal" data-target="#myModal">Create Package</a>
               </p>
               
               <PackagesList 
                onEdit={this.handleEdit}
                packages={this.state.packages} />
               
                
                <PackageForm title="Create/Edit Package" onSave={this.handleCreate} 
                formData={this.state.packageToEdit} />
          </div>
        );
    }
});