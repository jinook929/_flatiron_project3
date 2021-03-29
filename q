
[1mFrom:[0m /mnt/c/Users/jinoo/Desktop/CS/Flatiron/Development/code/phase3/_flatiron_project3/app/controllers/sessions_controller.rb:17 SessionsController#create:

     [1;34m6[0m: [32mdef[0m [1;34mcreate[0m
     [1;34m7[0m:   @user = [1;34;4mUser[0m.find_by([35memail[0m: params[[33m:user[0m][[33m:email[0m])
     [1;34m8[0m:   [32mif[0m @user && @user.authenticate(params[[33m:user[0m][[33m:password[0m])
     [1;34m9[0m:     session[[33m:user_id[0m] = @user.id
    [1;34m10[0m:     redirect_to @user
    [1;34m11[0m:   [32melse[0m
    [1;34m12[0m:     @alert = [31m[1;31m"[0m[31mLog in failed...[1;31m"[0m[31m[0m
    [1;34m13[0m:     [32mif[0m @user.nil?
    [1;34m14[0m:       @errors = [[31m[1;31m"[0m[31mEmail is not registered.[1;31m"[0m[31m[0m] 
    [1;34m15[0m:     [32melse[0m
    [1;34m16[0m:       @errors = @user.errors.full_messages
 => [1;34m17[0m:       binding.pry
    [1;34m18[0m:     [32mend[0m
    [1;34m19[0m:     @user = [1;34;4mUser[0m.new
    [1;34m20[0m:     render [31m[1;31m'[0m[31mnew[1;31m'[0m[31m[0m
    [1;34m21[0m:   [32mend[0m
    [1;34m22[0m: [32mend[0m

