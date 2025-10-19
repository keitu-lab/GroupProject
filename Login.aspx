<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OffTheGrit1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Login - OFF THE GRID
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .login-gradient {
           /* background: linear-gradient(135deg, hsl(220, 13%, 18%), hsl(220, 13%, 15%));*/
           background-color: #F8FAFC; /* This is the specific color value for bg-slate-50 */
        }
/*        .dark .login-gradient {
              background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
        }*/
        .form-gradient {
            background: linear-gradient(145deg, hsl(0, 0%, 100%), hsl(39, 100%, 99%));
        }
        .dark .form-gradient {
            background: linear-gradient(145deg, hsl(220, 13%, 15%), hsl(220, 13%, 12%));
        }
        .floating-label {
            transition: all 0.3s ease;
        }
        .input-focus {
            transition: all 0.3s ease;
        }
        .input-focus:focus {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 165, 0, 0.15);/*-moz-animation*/
        }
        .dark .input-focus:focus {
            box-shadow: 0 8px 25px rgba(255, 165, 0, 0.3);
        }
        .login-animation {
            animation: slideInUp 0.8s ease-out;
        }
        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .pulse-animation {
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Login Section -->
    <section class="min-h-screen login-gradient flex items-center dark:bg-gray-900 justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-md w-full">
            
            <!-- Login Card -->
            <div class="login-animation form-gradient rounded-2xl shadow-2xl p-8 md:p-10">
                
                <!-- Header -->
                <div class="text-center mb-8 ">
                    <div class="flex items-center justify-center mb-6">
                        <div class="pulse-animation w-16 h-16 bg-white border border-orange-500 rounded-full flex items-center justify-center">
                                    
                            <%--<span class="text-2xl font-bold text-white">OG</span>--%>
                            <img src="./images/OTG-logo-orange.png" width="45" alt="" class="text-2xl font-bold text-white" />
                        </div>
                    </div>
                    <h1 class="text-3xl font-bold text-gray-900 dark:text-white mb-2">Welcome Back</h1>
                    <p class="text-gray-600 dark:text-gray-300">Sign in to your OFF THE GRID account</p>
                </div>

                <!-- Message Display -->
                <div class="mb-6">
                    <asp:Label ID="lblMessage" runat="server" 
                        CssClass="block text-sm font-medium p-3 rounded-lg text-center" />
                </div>

                <!-- Login Form -->
                <div class="space-y-6">
                    
                    <!-- Email Input -->
                    <div class="relative">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Email Address
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"/>
                                </svg>
                            </div>
                            <asp:TextBox ID="txtEmail" runat="server" 
                                CssClass="input-focus w-full pl-10 pr-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent" 
                                placeholder="Enter your email address"
                                TextMode="Email" />
                        </div>
                    </div>

                    <!-- Password Input -->
                    <div class="relative">
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">
                            Password
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <svg class="w-5 h-5 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"/>
                                </svg>
                            </div>
                            <asp:TextBox ID="txtPassword" runat="server" 
                                CssClass="input-focus w-full pl-10 pr-4 py-4 border border-gray-300 dark:border-gray-600 rounded-xl bg-white dark:bg-gray-700 text-gray-900 dark:text-white placeholder-gray-500 dark:placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-orange-500 focus:border-transparent" 
                                placeholder="Enter your password"
                                TextMode="Password" />
                        </div>
                    </div>

                    <!-- Login Button -->
                    <div>
                        <asp:Button ID="btnLogin" runat="server" 
                            Text="Sign In" 
                            OnClick="btnLogin_Click"
                            CssClass="w-full bg-gradient-to-r bg-orange-500 dark:bg-orange-500 text-white from-orange-500 dark:text-white to-orange-600 hover:from-orange-600 hover:to-orange-700 dark:hover:from-orange-600 dark:hover:to-orange-700text-white py-4 px-6 rounded-xl font-bold text-lg transition-all duration-300 transform hover:scale-105 hover:shadow-2xl focus:outline-none focus:ring-4 focus:ring-orange-300 dark:focus:ring-orange-800" />
                    </div>

                </div>

                <!-- Register Link -->
                <div class="mt-8 text-center">
                    <p class="text-gray-600 dark:text-gray-300">
                        Don't have an account? 
                        <a href="Register.aspx" class="font-semibold text-orange-500 hover:text-orange-600 transition-colors duration-300">
                            Create an account
                        </a>
                    </p>
                </div>

            </div>

            <!-- Footer Info -->
            <div class="mt-8 text-center">
                <p class="text-sm text-gray-300">
                    By signing in, you agree to our 
                    <a href="#" class="text-orange-400 hover:text-orange-300">Terms of Service</a> and 
                    <a href="#" class="text-orange-400 hover:text-orange-300">Privacy Policy</a>
                </p>
            </div>
        </div>
    </section>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Form validation and visual feedback
            const emailInput = document.querySelector('[id*="txtEmail"]');
            const passwordInput = document.querySelector('[id*="txtPassword"]');
            const submitButton = document.querySelector('[id*="btnLogin"]');

            function validateEmail(email) {
                return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
            }

            function updateValidationState(input, isValid) {
                if (isValid) {
                    input.classList.remove('border-red-500', 'ring-red-500');
                    input.classList.add('border-green-500', 'ring-green-500');
                } else {
                    input.classList.remove('border-green-500', 'ring-green-500');
                    input.classList.add('border-red-500', 'ring-red-500');
                }
            }

            // Real-time validation
            emailInput.addEventListener('blur', function() {
                const isValid = validateEmail(this.value);
                updateValidationState(this, isValid);
            });

            passwordInput.addEventListener('blur', function() {
                const isValid = this.value.length >= 6;
                updateValidationState(this, isValid);
            });

            //// Enhanced form submission
            //submitButton.addEventListener('click', function(e) {
            //    const emailValid = validateEmail(emailInput.value);
            //    const passwordValid = passwordInput.value.length >= 6;

            //    if (!emailValid || !passwordValid) {
            //        e.preventDefault();
                    
            //        // Show validation errors
            //        if (!emailValid) {
            //            updateValidationState(emailInput, false);
            //            emailInput.focus();
            //        }
            //        if (!passwordValid) {
            //            updateValidationState(passwordInput, false);
            //        }

            //        // Show error message
            //        const messageLabel = document.querySelector('[id*="lblMessage"]');
            //        if (messageLabel) {
            //            messageLabel.textContent = 'Please fill in all fields correctly';
            //            messageLabel.className = 'block text-sm font-medium p-3 rounded-lg text-center bg-red-50 dark:bg-red-900/20 text-red-700 dark:text-red-400 border border-red-200 dark:border-red-800';
            //        }
            //    } else {
            //        // Show loading state
            //        this.innerHTML = `
            //            <svg class="animate-spin -ml-1 mr-3 h-5 w-5 text-white inline" fill="none" viewBox="0 0 24 24">
            //                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            //                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
            //            </svg>
            //            Signing In...
            //        `;
            //        this.disabled = true;
            //    }
            //});

            // Add smooth focus animations
            const inputs = document.querySelectorAll('input[type="email"], input[type="password"]');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.classList.add('scale-105');
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.classList.remove('scale-105');
                });
            });
        });
    </script>
</asp:Content>
