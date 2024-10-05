function varargout = resamplingupp(varargin)
% RESAMPLINGUPP MATLAB code for resamplingupp.fig
%      RESAMPLINGUPP, by itself, creates a new RESAMPLINGUPP or raises the existing
%      singleton*.
%
%      H = RESAMPLINGUPP returns the handle to a new RESAMPLINGUPP or the handle to
%      the existing singleton*.
%
%      RESAMPLINGUPP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RESAMPLINGUPP.M with the given input arguments.
%
%      RESAMPLINGUPP('Property','Value',...) creates a new RESAMPLINGUPP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before resamplingupp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to resamplingupp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help resamplingupp

% Last Modified by GUIDE v2.5 17-May-2022 19:17:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @resamplingupp_OpeningFcn, ...
                   'gui_OutputFcn',  @resamplingupp_OutputFcn, ...
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


% --- Executes just before resamplingupp is made visible.
function resamplingupp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to resamplingupp (see VARARGIN)

% Choose default command line output for resamplingupp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes resamplingupp wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = resamplingupp_OutputFcn(hObject, eventdata, handles) 
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
[filename, pathname] = uigetfile({'*.jpg';'*.bmp';'*.png'},'File Selector');
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



global originalImage x2 i2 no l x l2 c r SamplingFactor matrixno
[r,c,matrixno]=size(originalImage);
x2=1;
i2=1;
SamplingFactor=str2double(get(handles.subsampling_factor,'string'));
global img2;
for no=1:matrixno
for i=1:r
    for l=1:SamplingFactor
        for x=1:c
            for l2=1:SamplingFactor
                img2(i2,x2)=originalImage(i,x);
                x2=x2+1;
            end
        end
        i2=i2+1;
        x2=1;
    end
end
end
% axes(handles.axes2);

imshow(img2);
[r,c]=size(img2);
disp(r);
disp(c);



function subsampling_factor_Callback(hObject, eventdata, handles)
% hObject    handle to subsampling_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subsampling_factor as text
%        str2double(get(hObject,'String')) returns contents of subsampling_factor as a double


% --- Executes during object creation, after setting all properties.
function subsampling_factor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subsampling_factor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
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
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.prev,'visible','on');
% set(handles.output,'visible','off');
close;
open('sec.fig');


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img2
[baseFileName, folder] = uiputfile({'.jpg';'.bmp';'.jpg';'.jpeg';'*.png'}, 'Specify a file');%open save box (making specify a file 'title'
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName) 
imwrite( img2, fullFileName);


