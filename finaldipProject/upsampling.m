function varargout = upsampling(varargin)
% UPSAMPLING MATLAB code for upsampling.fig
%      UPSAMPLING, by itself, creates a new UPSAMPLING or raises the existing
%      singleton*.
%
%      H = UPSAMPLING returns the handle to a new UPSAMPLING or the handle to
%      the existing singleton*.
%
%      UPSAMPLING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UPSAMPLING.M with the given input arguments.
%
%      UPSAMPLING('Property','Value',...) creates a new UPSAMPLING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before upsampling_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to upsampling_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help upsampling

% Last Modified by GUIDE v2.5 17-May-2022 20:39:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @upsampling_OpeningFcn, ...
                   'gui_OutputFcn',  @upsampling_OutputFcn, ...
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


% --- Executes just before upsampling is made visible.
function upsampling_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to upsampling (see VARARGIN)

% Choose default command line output for upsampling
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes upsampling wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = upsampling_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(~, ~, handles)
[filename, pathname] = uigetfile({'*.jpg';'*.bmp'},'File Selector');
 global image 
 image = strcat(pathname, filename);
global originalImage
originalImage = imread(image);
axes(handles.axes1);
imshow(originalImage );

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function samplingfactor_edit_Callback(~, ~, ~)
% hObject    handle to samplingfactor_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of samplingfactor_edit as text
%        str2double(get(hObject,'String')) returns contents of samplingfactor_edit as a double


% --- Executes during object creation, after setting all properties.
function samplingfactor_edit_CreateFcn(hObject, ~, ~)
% hObject    handle to samplingfactor_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
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
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(~, ~, handles)

global originalImage
[rows cols matricesNo] = size(originalImage);
disp(rows)
disp(cols)
SamplingFactor=str2double(get(handles.samplingfactor_edit,'string'));
disp(SamplingFactor)
for metricesIndex=1:1:matricesNo
    resizedImage(:,:,metricesIndex) = subSampling(originalImage(:,:,metricesIndex),SamplingFactor);
end
axes(handles.axes2);

imshow(resizedImage)


function [outImage] = subSampling(image, subSamplingFactor)
[rows cols] = size(image);
outImage = image(1:subSamplingFactor:rows,1:subSamplingFactor:cols);


% [r,c,matrixno]=size(originalImage);
% disp(c)
% disp(r)
% x2=1;
% i2=1;
% SamplingFactor=str2double(get(handles.samplingfactor_edit,'string'));
%  global img2
%  img2=originalImage;
% for no=1:matrixno
% for i=1:r
%     for l=1:SamplingFactor
%         for x=1:c
%             for l2=1:SamplingFactor
%                 img2(i2,x2)=originalImage(i,x);
%                 x2=x2+1;
%             end
%         end
%         i2=i2+1;
%         x2=1;
%     end
% end
% end
%  disp(SamplingFactor);
% axes(handles.axes2);
% imshow(img2);
% [r,c]=size(img2);
% disp(r);
% disp(c);


% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close;
open('sec.fig');

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global resizedImage
[baseFileName, folder] = uiputfile({'.jpg';'.bmp';'.jpg';'.jpeg';'*.png'}, 'Specify a file');%open save box (making specify a file 'title'
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName) 
imwrite( resizedImage, fullFileName);
