var ClassifiedListTable = createReactClass({

    
    render: function() {
        var vm = this;
        var rows = this.props.packages.map(function(p){
            return (
                 <tr key={p.id}>
                    <td>{p.title}</td>
                    <td>{p.price}</td>
                    <td>{p.time_length}</td>
                    <td className="actions">
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
                    <th>Time length</th>

                    <th></th>
                </tr>
                
               {rows}
                
                </tbody>
          </table>
        );
    }
});