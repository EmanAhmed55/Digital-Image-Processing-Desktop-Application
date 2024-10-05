function varargout = Gaussian_low_pass_filter(varargin)
% GAUSSIAN_LOW_PASS_FILTER MATLAB code for Gaussian_low_pass_filter.fig
%      GAUSSIAN_LOW_PASS_FILTER, by itself, creates a new GAUSSIAN_LOW_PASS_FILTER or raises the existing
%      singleton*.
%
%      H = GAUSSIAN_LOW_PASS_FILTER returns the handle to a new GAUSSIAN_LOW_PASS_FILTER or the handle to
%      the existing singleton*.
%
%      GAUSSIAN_LOW_PASS_FILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GAUSSIAN_LOW_PASS_FILTER.M with the given input arguments.
%
%      GAUSSIAN_LOW_PASS_FILTER('Property','Value',...) creates a new GAUSSIAN_LOW_PASS_FILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Gaussian_low_pass_filter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Gaussian_low_pass_filter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Gaussian_low_pass_filter

% Last Modified by GUIDE v2.5 19-May-2022 02:09:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Gaussian_low_pass_filter_OpeningFcn, ...
                   'gui_OutputFcn',  @Gaussian_low_pass_filter_OutputFcn, ...
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


% --- Executes just before Gaussian_low_pass_filter is made visible.
function Gaussian_low_pass_filter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Gaussian_low_pass_filter (see VARARGIN)

% Choose default command line output for Gaussian_low_pass_filter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Gaussian_low_pass_filter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Gaussian_low_pass_filter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'.jpg';'.bmp'},'File Selector');
 global image 
 image = strcat(pathname, filename);
global originalImage
originalImage = imread(image);
axes(handles.axes1);
imshow(originalImage )

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global output_image;
global originalImage;
[z,f,m]=size(originalImage);
if(m==3)
  Image=rgb2gray(originalImage);
end

[X,Y]=size(Image);
FT_img=fft2(double(Image));
D0=str2double(get(handles.edit1,'string'));

u= 0:(X-1);
idx=find(u>X/2);
u(idx)=u(idx)-X;

v=0:(Y-1);
idy=find(v>Y/2);
v(idy)=v(idy)-Y;

[V,U]=meshgrid(v,u);
D=sqrt(U.^2+V.^2);
D=-D.^2;
H=exp(D/D0);
G=H.*FT_img;
 axes(handles.axes2);
output_image =real(ifft2(double(G)));

imshow(output_image,[])




function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha = axes('units','normalized', ...
            'position',[0 0 1 1]);
% Move the background axes to the bottom
uistack(ha,'bottom');
% Load in a background image and display it using the correct colors
% The image used below, is in the Image Processing Toolbox.  If you do not have %access to this toolbox, you can use another image file instead.
I=imread('back.jpg');
hi = imagesc(I)
colormap gray
% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off', ...
            'visible','off')
% Now we can use the figure, as required.
% For example, we can put a plot in an axes
axes('position',[0,0,0,0])
plot(rand(10))


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global output_image;

[baseFileName, folder] = uiputfile({'.jpg';'.bmp';'.jpg';'.jpeg';'*.png'}, 'Specify a file');%open save box (making specify a file 'title'
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName) 
imwrite( output_image, fullFileName);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
IdealHighpassFilterfig;



% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
Gaussian_high_pass_filter;
