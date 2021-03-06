var ListForm = createReactClass({
    getInitialState: function () {
        return {
            formData: {}
        }
    },
    handleSubmit: function(){
        this.props.onSave(this.state.formData)

    },
    componentWillReceiveProps: function (p) {
        this.setState({
           formData: p.formData
        });

    },
    onChange: function(event) {

        this.setState({
            formData: Object.assign({}, this.state.formData, {
                [event.target.name]: event.target.value
            })

        });
    },
    render: function(){
        return (
        <div className="modal fade" id="myModal" role="dialog" aria-labelledby="mymodallabel">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <button type="button" className="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 className="modal-title" id="myModalLabel">
                    {this.props.title}
                </h4>
              </div>
              <div className="modal-body">
                 <div className="form-group">
                    <label>Name</label>
                    <input type="text" 
                        name="title"
                        onChange={this.onChange}
                        value={this.state.formData.title}
                        className="form-control"></input>
                </div>

                <div className="form-group">
                    <label>Price</label>
                    <input type="text"
                           name="price"
                           onChange={this.onChange}
                           value={this.state.formData.price}
                           className="form-control"></input>
                </div>
                <div className="form-group">
                    <label>Time length</label>
                    <input type="text"
                           name="time_length"
                           onChange={this.onChange}
                           value={this.state.formData.time_length}
                           className="form-control"></input>
                </div>
                


              </div>
              <div className="modal-footer">
                <button type="button"  className="btn btn-danger" data-dismiss="modal">Close</button>
                <button type="button" onClick={this.handleSubmit} className="btn btn-primary">Save changes</button>
              </div>
            </div>
          </div>
        </div>
    );
        
    }
});