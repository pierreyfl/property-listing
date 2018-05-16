var ClassifiedListTable = createReactClass({

    
    render: function() {
        var vm = this;
        var rows = this.props.packages.map(function(p){
            return (
                 <tr key={p.id}>
                    <td>{p.title}</td>
                    <td>{p.price}</td>
                    <td>{p.time_length}</td>
                    <td>
                        <a className="btn btn-primary btn-xs" onClick={ vm.props.onEdit.bind(null, p) } data-toggle="modal" data-target="#myModal" >Edit</a> 
                        <a className="btn btn-danger btn-xs" onClick={vm.props.onDelete.bind(null, p)}>Delete</a>
            
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
                    <th>Time length</th>

                    <th></th>
                </tr>
                
               {rows}
                
                </tbody>
          </table>
        );
    }
});