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
                    <td>{p.listings_amount}</td>
                    <td className="actions">
                        <a href="javascript:void(0)" onClick={ vm.props.onSelect.bind(null, p) } data-toggle="modal" data-target="#AmenitiesModal">Amenities</a>
                        <a href="javascript:void(0)"  onClick={ vm.props.onEdit.bind(null, p) } data-toggle="modal" data-target="#myModal" ><i className="fa fa-edit"></i></a>
                        <a href="javascript:void(0)"  onClick={vm.props.onDelete.bind(null, p)}><i className="fa fa-trash-o text-danger"></i></a>
            
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
                    <th>Listings amount</th>
                    <th></th>
                </tr>
                
               {rows}
                
                </tbody>
          </table>
        );
    }
});