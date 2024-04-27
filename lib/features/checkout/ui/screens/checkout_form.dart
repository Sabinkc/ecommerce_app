import 'package:flutter/material.dart';
import '../../../../custom_widget/custom_rounded_buttom.dart';
import '../../../../custom_widget/custom_text_form_field.dart';

class CheckoutForm extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
   CheckoutForm({super.key});


  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    //  final weight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        centerTitle: true,
        // leading: const BackButton(
        //   color: Color.fromARGB(255, 47, 46, 46),
        // ),

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.grey.shade800,)),
        title: Text("checkout page",
        style: TextStyle(
          color: Colors.grey.shade800,
          fontSize: 18,
        ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                      const Text('Please fill the form for you check out details form below',
                      textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black45, fontSize: 17)),
                          const SizedBox(height: 40,),
                           Form(
                                         key: _formkey,
                                         child: Column(
                                           
                                           children: [
                                             CustomTextFormField(
                                               controller: _nameController,
                                               label: "Full Name",
                                               validator: (value){
                            if (value == null){
                              return "Please Fill the full name";
                            }else if (value.isEmpty){
                              return "Please fill the full name ";
                            }else{
                              return null;
                            }
                                                 },
                                             ),
                           
                                             
                                             CustomTextFormField(
                                               controller: _addressController,
                                               label: "Address",
                                               validator: (value){
                            if (value == null){
                              return "Please Fill the address";
                            }else if (value.isEmpty){
                              return "Please Fill the address ";
                            }else{
                              return null;
                            }
                                                 },
                                             ),
                                             CustomTextFormField(
                                               controller: _phoneNumberController,
                                               keyboardType: TextInputType.phone,
                                               label: "Phone Number",
                                               validator: (value){
                            if (value == null){
                              return "Please Fill the phone number";
                            }else if (value.isEmpty){
                              return "Please Fill the phone number ";
                            }else{
                              return null;
                            }
                                                 },
                                             ),
                                              CustomTextFormField(
                                               controller: _emailController,
                                               keyboardType: TextInputType.emailAddress,
                           
                                               label: "email@gmail.com",
                                               validator: (value){
                            if (value == null){
                              return "Please Fill the email";
                            }else if (value.isEmpty){
                              return "Please Fill the email ";
                            }else{
                              return null;
                            }
                                                 },
                                             ),
                                             CustomTextFormField(
                                               controller: _passwordController,
                                               keyboardType: TextInputType.visiblePassword,
                           
                                               label: "Password",
                                               validator: (value){
                            if (value == null){
                              return "Please Fill the password";
                            }else if (value.isEmpty){
                              return "Please Fill the password ";
                            }else{
                              return null;
                            }
                                                 },
                                             ),
                                             CustomTextFormField(
                                               controller: _confirmPasswordController,
                                               keyboardType: TextInputType.visiblePassword,
                           
                                               label: "Confirm-Password",
                                               validator: (value){
                            if (value == null){
                              return "Please Fill the confirm-password";
                            }else if (value.isEmpty){
                              return "Please Fill the confirm-password ";
                            }else{
                              return null;
                            }
                                                 },
                                             ),
                                            
                                           ],
                                         ),
                                       ),
                
                const SizedBox(height: 20,),
                           
                CustomRoundedButton(
                title: "Choose Payment Option",
                onPressed: () {
                   
                  // if(_formkey.currentState!.validate()){}
                },
               ),
               
              ],
              ),
        ),
      ),
        
           
          
           
            
        
        
      

    );
  }
}