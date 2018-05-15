var PackagesList = createReactClass({
    

    delete: function(id) {console.log('delete', id)},
    
    render: function() {
        //var Button = ReactBootstrap.Button;
        var vm = this;
        var rows = this.props.packages.map(function(p){
            return (
                 <tr key={p.id}>
                    <td>{p.name}</td>
                    <td>{p.price}</td>
                    <td>{p.listing_period}</td>
                    <td></td>
                    <td>
                        <a className="btn btn-primary btn-xs" onClick={ vm.props.onEdit.bind(null, p) } data-toggle="modal" data-target="#myModal" >Edit</a> 
                        <a className="btn btn-danger btn-xs" onClick={vm.delete}>Delete</a>  
            
                    </td>
                </tr>
                );
        });
        
        return (
            <table className="table">
            <tbody>
               <tr>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Period</th>
                    <th>Expiry</th>
                    <th></th>
                </tr>
                
               {rows}
                
                </tbody>
          </table>
        );
    }
});