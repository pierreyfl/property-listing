var PackageForm = createReactClass({
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
                        name="name" 
                        onChange={this.onChange}
                        value={this.state.formData.name}
                        className="form-control"></input>
                </div>
                <div className="form-group">
                    <label>Listing period</label>
                    <input type="text"
                       name="listing_period"
                       onChange={this.onChange}
                       value={this.state.formData.listing_period}
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
                    <label>Listings amount</label>
                    <input type="text"
                           name="listings_amount"
                           onChange={this.onChange}
                           value={this.state.formData.listings_amount}
                           className="form-control"></input>
                </div>
                
                <div className="form-group">
                    <label>
                         
                        <input type="radio"
                               onChange={this.onChange}
                               checked={this.state.formData.type === 'standard'} value="standard" name="type"></input>  Standard
                    </label> <label>
                        
                        <input type="radio"
                               onChange={this.onChange}
                               checked={this.state.formData.type === 'premium'} value="premium" name="type"></input>  Premium
                    </label> <label>
                        <input type="radio"
                               onChange={this.onChange}
                               checked={this.state.formData.type === 'featured'} value="featured" name="type"></input>  Featured
                    </label>
                    
                </div>
                <div className="form-group">
                    <label>
                         
                        <input type="radio"
                               onChange={this.onChange}
                               value="single"
                               checked={this.state.formData.single_multi === 'single'}
                               name="single_multi"></input>  Single
                    </label> <label>
                        
                        <input type="radio"
                               onChange={this.onChange}
                               value="multi"
                               checked={this.state.formData.single_multi === 'multi'}
                               name="single_multi"></input>  Multi
                    </label> 
                    
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