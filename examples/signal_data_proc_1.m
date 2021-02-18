function varargout = signal_data_proc_1(varargin)
% SIGNAL_DATA_PROC_1 MATLAB code for signal_data_proc_1.fig
%      SIGNAL_DATA_PROC_1, by itself, creates a new SIGNAL_DATA_PROC_1 or raises the existing
%      singleton*.
%
%      H = SIGNAL_DATA_PROC_1 returns the handle to a new SIGNAL_DATA_PROC_1 or the handle to
%      the existing singleton*.
%
%      SIGNAL_DATA_PROC_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIGNAL_DATA_PROC_1.M with the given input arguments.
%
%      SIGNAL_DATA_PROC_1('Property','Value',...) creates a new SIGNAL_DATA_PROC_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before signal_data_proc_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to signal_data_proc_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help signal_data_proc_1

% Last Modified by GUIDE v2.5 17-Feb-2021 13:05:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @signal_data_proc_1_OpeningFcn, ...
                   'gui_OutputFcn',  @signal_data_proc_1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before signal_data_proc_1 is made visible.
function signal_data_proc_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to signal_data_proc_1 (see VARARGIN)

% Choose default command line output for signal_data_proc_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes signal_data_proc_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = signal_data_proc_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sinusoid.
function sinusoid_Callback(hObject, eventdata, handles)
% hObject    handle to sinusoid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
max_amplitude = 20;
random_amplitude = rand(1,1)*max_amplitude; % create random amplitude

t = (0:0.01:1)*10*pi; % line space 0 to 10pi with 100 interval points.
y = random_amplitude * sin(t); %Generate signal with random amplitude.
data = struct('t',t,'y',y,'amp',random_amplitude);
hObject.UserData = data; %pass data to hObject for another callback Fn to use.
axes(handles.axes1); %set to plot in axes1
plot(t, y);

% --- Executes on button press in noise.
function noise_Callback(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = findobj('Tag','sinusoid');
data = h.UserData;
noisy_y = data.y + randsample( data.amp *randn(1, length(data.y)*100), 101);% Noisy signal
noise_data = struct('noise',noisy_y);
hObject.UserData = noise_data; %pass data to hObject for another callback Fn to use.

axes(handles.axes2);
plot(data.t,noisy_y);


% --- Executes on button press in fft_freq.
function fft_freq_Callback(hObject, eventdata, handles)
% hObject    handle to fft_freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h1 = findobj('Tag','sinusoid');
h2 = findobj('Tag','noise');
data = h1.UserData;
noise_data = h2.UserData;
fft_y = fft(noise_data.noise); %Fast Fourier Transform
fft_data = struct('fft_freq',fft_y);
hObject.UserData = fft_data;
axes(handles.axes3);
plot(data.t, abs(fft_y));
ylim([0 200]);



% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

val = get(hObject,'Value');
set(handles.text2,'String',num2str(val));

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in restore.
function restore_Callback(hObject, eventdata, handles)
% hObject    handle to restore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
r = str2double(get(handles.text2,'String'));
h1 = findobj('Tag','fft_freq');
fft_y = h1.UserData.fft_freq;
h2 = findobj('Tag','sinusoid');
t = h2.UserData.t;
rectangle = zeros(size(fft_y));
rectangle(1:r+1) = 1;               % preserve low frequencies

y_filtered = ifft(fft_y.*rectangle);   % low-pass filtered signal
axes(handles.axes4);
plot(t, y_filtered);