<?php

namespace App\Http\Controllers\Api;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Password;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
class AuthenticationController extends Controller
{
    public function store()
    {
        if (Auth::attempt(['email' => request('email'), 'password' => request('password')]))
        {
            // successfull authentication
            $user = User::find(Auth::user()->id);
            if ($user->status == 'inactive')
            {
                return response()->json([
                    'success' => false,
                    'message' => 'Failed to authenticate.',
                ], 401);
            } else
            {
                $user_token['token']  = $user->createToken('appToken')->accessToken;
                $user->remember_token = $user_token;
                $user->save();
                return response()->json([
                    'success' => true,
                    'token'   => $user_token,
                    'user'    => $user,
                ], 200);
            }

        } else
        {
            // failure to authenticate
            return response()->json([
                'success' => false,
                'message' => 'Failed to authenticate.',
            ], 401);
        }
    }
    /**
     * Destroy an authenticated session.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        if (Auth::user())
        {
            $request->user()->token()->revoke();

            return response()->json([
                'success' => true,
                'message' => 'Logged out successfully',
            ], 200);
        }
    }
    public function saveNewUser(Request $request)
    {
        $this->validate($request, [
            'full_name'   => 'string|required',
            'description' => 'string|nullable',
            'phone'       => 'string|required',
            'email'       => 'string|required',
            'password'    => 'string|required',
            'address'     => 'string|required',

        ]);

        // $messages = [
        //     'g-recaptcha-response.required' => 'You must check the reCAPTCHA.',
        //     'g-recaptcha-response.captcha' => 'Captcha error! try again later or contact site admin.',
        // ];

        // $validator = Validator::make($request->all(), [
        //     'g-recaptcha-response' => 'required|captcha'
        // ], $messages);
        // if ($validator->fails()) {
        //     return redirect( )->route('home')
        //                 ->withErrors($validator)
        //                 ->withInput();
        // }
        $data = $request->all();

        $olduser = \App\Models\User::where('phone', $data['phone'])->get();
        if (count($olduser) > 0)
            return response()->json([
                'success' => false,
                'message' => 'SDT đã tồn tại!',
            ], 200);
        $olduser = \App\Models\User::where('email', $data['email'])->get();
        if (count($olduser) > 0)
            return response()->json([
                'success' => false,
                'message' => 'Email đã tồn tại!',
            ], 200);
        $data['photo']    = asset('backend/assets/dist/images/profile-6.jpg');
        $data['password'] = Hash::make($data['password']);
        $data['username'] = $data['phone'];
        $data['role']     = 'customer';
        $status           = \App\Models\User::c_create($data);
        if (! $status)
        {
            return response()->json([
                'success' => false,
                'message' => 'Ohh! Error :(((',
            ], 200);
        }
        // $credentials = $request->only('email', 'password');
        // \Auth::attempt($credentials);
        // $request->session()->regenerate();
        // Tạo token sau khi đăng ký thành công và lưu vào database
        $user                 = User::where('email', $data['email'])->first();
        $token                = $user->createToken('appToken')->accessToken;
        $user->remember_token = $token;
        $user->save();
        return response()->json([
            'success' => true,
            'message' => 'Đăng ký thành công !',
            'token' => $token,
        ], 200);
    }



}
