%% PROJECT STAGE 6

% Added a Complete Table button to display the image of the whole atomic table.

% Added the back button which is used to exit the image.

%%

classdef project_stage6 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                   matlab.ui.Figure
        BackButton                 matlab.ui.control.Button
        Image3                     matlab.ui.control.Image
        ThisprogramletsyouLabel    matlab.ui.control.Label
        CompleteTableButton        matlab.ui.control.Button
        UITable                    matlab.ui.control.Table
        Panel                      matlab.ui.container.Panel
        TextArea                   matlab.ui.control.TextArea
        Image                      matlab.ui.control.Image
        GoButton                   matlab.ui.control.Button
        EditField                  matlab.ui.control.NumericEditField
        EditField_2                matlab.ui.control.EditField
        PleaseEnterDropDown        matlab.ui.control.DropDown
        PleaseEnterLabel           matlab.ui.control.Label
        GoGrouped                  matlab.ui.control.Button
        GroupedDropdown            matlab.ui.control.DropDown
        PleaseChooseDropDownLabel  matlab.ui.control.Label
        Switch                     matlab.ui.control.Switch
    end

    properties (Access = private)
        
        % Initializing atomicNumber to store the atomic numbers.
        atomicNumber = [1:118];
        
        % Initializing atomicSymbols to store the atomic symbols.
        atomicSymbols = [
            "H", "He", "Li", "Be", "B", "C", "N", "O", "F", "Ne", "Na", "Mg", ...
            "Al", "Si", "P", "S", "Cl", "Ar", "K", "Ca", "Sc", "Ti", "V", "Cr", ...
            "Mn", "Fe", "Co", "Ni", "Cu", "Zn", "Ga", "Ge", "As", "Se", "Br", "Kr", ...
            "Rb", "Sr", "Y", "Zr", "Nb", "Mo", "Tc", "Ru", "Rh", "Pd", "Ag", "Cd", ...
            "In", "Sn", "Sb", "Te", "I", "Xe", "Cs", "Ba", "La", "Ce", "Pr", "Nd", ...
            "Pm", "Sm", "Eu", "Gd", "Tb", "Dy", "Ho", "Er", "Tm", "Yb", "Lu", "Hf", ...
            "Ta", "W", "Re", "Os", "Ir", "Pt", "Au", "Hg", "Tl", "Pb", "Bi", "Po", ...
            "At", "Rn", "Fr", "Ra", "Ac", "Th", "Pa", "U", "Np", "Pu", "Am", "Cm", ...
            "Bk", "Cf", "Es", "Fm", "Md", "No", "Lr", "Rf", "Db", "Sg", "Bh", "Hs", ...
            "Mt", "Ds", "Rg", "Cn", "Nh", "Fl", "Mc", "Lv", "Ts", "Og"
        ];
        
        % Initializing atomicElements to store the names of all atomic elements.
        atomicElements = [
            "Hydrogen", "Helium", "Lithium", "Beryllium", "Boron", "Carbon", ...
            "Nitrogen", "Oxygen", "Fluorine", "Neon", "Sodium", "Magnesium", ...
            "Aluminum", "Silicon", "Phosphorus", "Sulfur", "Chlorine", "Argon", ...
            "Potassium", "Calcium", "Scandium", "Titanium", "Vanadium", "Chromium", ...
            "Manganese", "Iron", "Cobalt", "Nickel", "Copper", "Zinc", "Gallium", ...
            "Germanium", "Arsenic", "Selenium", "Bromine", "Krypton", "Rubidium", ...
            "Strontium", "Yttrium", "Zirconium", "Niobium", "Molybdenum", "Technetium", ...
            "Ruthenium", "Rhodium", "Palladium", "Silver", "Cadmium", "Indium", "Tin", ...
            "Antimony", "Tellurium", "Iodine", "Xenon", "Cesium", "Barium", "Lanthanum", ...
            "Cerium", "Praseodymium", "Neodymium", "Promethium", "Samarium", "Europium", ...
            "Gadolinium", "Terbium", "Dysprosium", "Holmium", "Erbium", "Thulium", ...
            "Ytterbium", "Lutetium", "Hafnium", "Tantalum", "Tungsten", "Rhenium", ...
            "Osmium", "Iridium", "Platinum", "Gold", "Mercury", "Thallium", "Lead", ...
            "Bismuth", "Polonium", "Astatine", "Radon", "Francium", "Radium", "Actinium", ...
            "Thorium", "Protactinium", "Uranium", "Neptunium", "Plutonium", "Americium", ...
            "Curium", "Berkelium", "Californium", "Einsteinium", "Fermium", ...
            "Mendelevium", "Nobelium", "Lawrencium", "Rutherfordium", "Dubnium", ...
            "Seaborgium", "Bohrium", "Hassium", "Meitnerium", "Darmstadtium", ...
            "Roentgenium", "Copernicium", "Nihonium", "Flerovium", "Moscovium", ...
            "Livermorium", "Tennessine", "Oganesson"
        ];
        
        % Initializing atomicGroup to store the types of all atomic elements.
        atomicGroup = [
            "r", "n", "a", "al", "m", "r", "r", "r", "r", "n", "a", "al", ...
            "p", "m", "r", "r", "r", "n", "a", "al", "t", "t", "t", "t", ...
            "t", "t", "t", "t", "t", "t", "p", "m", "m", "r", "r", "n", "a", ...
            "al", "t", "t", "t", "t", "t", "t", "t", "t", "t", "t", "p", "p", ...
            "m", "m", "r", "n", "a", "al", "l", "l", "l", "l", "l", "l", ...
            "l", "l", "l", "l", "l", "l", "l", "l", "l", "t", "t", "t",...
            "t", "t", "t", "t", "t", "t", "p", "p", "p", "p", "m", "n",...
            "a", "al", "ac", "ac", "ac", "ac", "ac", "ac", "ac", "ac",...
            "ac", "ac", "ac", "ac", "ac", "ac", "ac", "t", "t", "t", "t",...
            "t", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u"
        ];
    end

    methods (Access = private)
        
        % Function to provide a lookup which returns the corresponding 
        % atomic symbol and atomic name when atomic number is provided
        function [num] = atomNum(app,value)
            num = [app.atomicNumber(value), app.atomicSymbols(value), app.atomicElements(value)];
        end

        % Function to provide a lookup which returns the corresponding 
        % atomic number and atomic name when atomic symbol is provided
        function [symbol] = atomSymbol(app,value)
            symbol=  [];
            for i = 1:118
                if contains(app.atomicSymbols(i), value,'IgnoreCase',true)
                    symbol = [symbol; app.atomicNumber(i), app.atomicSymbols(i), app.atomicElements(i)];
                end
            end
        end

        % Function to provide a lookup which returns the corresponding 
        % atomic number and atomic symbol when atomic name is provided
        function [name] = atomName(app,value)
            name=  [];
            for i = 1:118
                if contains(app.atomicElements(i), value,'IgnoreCase',true)
                    name = [name; app.atomicNumber(i), app.atomicSymbols(i), app.atomicElements(i)];
                end
            end
        end
        
        % Function to provide a lookup which returns the corresponding 
        % details of all elements when atomic group type is provided
        function [name] = groupedLookup(app, value)
            name = [];
            for i = 1:118
                if (strcmp(value, app.atomicGroup(i)))
                    name = [name; app.atomicNumber(i), app.atomicSymbols(i), app.atomicElements(i)];
                end
            end
        end

    end

    % Callbacks that handle component events
    methods (Access = private)

        % Clicked callback: PleaseEnterDropDown
        function PleaseEnterDropDownClicked(app, event)
            
            % Switch case to change the text box between numeric and
            % letters according to the option selected by the user.
            switch app.PleaseEnterDropDown.Value
                case "Atomic Number"
                    app.EditField.Visible = "on";
                    app.EditField.Editable = "on";
                    app.EditField_2.Visible = "off";
                    app.EditField_2.Editable = "off";
                case "Atomic Symbol"
                    app.EditField.Visible = "off";
                    app.EditField.Editable = "off";
                    app.EditField_2.Visible = "on";
                    app.EditField_2.Editable = "on";
                case "Atomic Name"
                    app.EditField.Visible = "off";
                    app.EditField.Editable = "off";
                    app.EditField_2.Visible = "on";
                    app.EditField_2.Editable = "on";
            end
        end

        % Value changed function: PleaseEnterDropDown
        function PleaseEnterDropDownValueChanged(app, event)
            
            % Resetting the value of input fields when user selects a
            % different dropdown option.
            app.EditField.Value = 1;
            app.EditField_2.Value = "";

        end

        % Button pushed function: GoButton
        function GoButtonPushed(app, event)
            
            % Displaying the table when go button is pressed
            app.UITable.Visible = "on";
            
            % Storing the values entered by the user.
            value = app.EditField.Value;
            value1 = app.EditField_2.Value;
            
            % Switch case for calling the lookup based on the option
            % selected by the user and displaying the results in the table.
            switch app.PleaseEnterDropDown.Value
                case "Atomic Number"
                    app.UITable.Data = atomNum(app, value);
                case "Atomic Symbol"
                    app.UITable.Data = atomSymbol(app, value1);
                case "Atomic Name"
                    app.UITable.Data = atomName(app, value1);
            end
            
            % Warning the user if the atomic symbol value if more than two
            % letters
            if strcmp (app.PleaseEnterDropDown.Value, "Atomic Symbol") && (length(value1)>2)
                app.TextArea.Value = "Atomic Symbol cannot be more than" + ...
                    " 2 letters";
                app.TextArea.Visible = "on";
                app.UITable.Visible = "off";
                app.Image.Visible = "off";
            
            % Displaying sorry message if no matching value was found
            elseif isempty(app.UITable.Data)
                app.TextArea.Value = "No Match Found";
                app.TextArea.Visible = "on";
                app.Image.Visible = "on";
                app.UITable.Visible = "off";

            % Removing any warning/sorry messages if a match is found.
            else
                app.TextArea.Visible = "off";
                app.Image.Visible = "off";
            end
        end

        % Value changed function: Switch
        function SwitchValueChanged(app, event)
            app.UITable.Visible = "off";
            if strcmp(app.Switch.Value, "Grouped")
                app.Panel.Visible = "off";
            else
                app.Panel.Visible = "on";
            end
        end

        % Button pushed function: GoGrouped
        function GoGroupedButtonPushed(app, event)
            % Displaying the table when Go button for grouped state is
            % pressed
            app.UITable.Visible = "on";

            % Switch case for all the different options in the grouped
            % dropdown menu
            switch app.GroupedDropdown.Value
                case "Actinoids"
                    app.UITable.Data = groupedLookup(app, "ac");
                case "Alkali Metals"
                    app.UITable.Data = groupedLookup(app, "a");
                case "Alkaline Earth Metals"
                    app.UITable.Data = groupedLookup(app, "al");
                case "Lanthanoids"
                    app.UITable.Data = groupedLookup(app, "l");
                case "Metalloids"
                    app.UITable.Data = groupedLookup(app, "m");
                case "Noble Gases"
                    app.UITable.Data = groupedLookup(app, "n");
                case "Post-Trasition Metals"
                    app.UITable.Data = groupedLookup(app, "p");
                case "Reactive Nonmetals"
                    app.UITable.Data = groupedLookup(app, "r");
                case "Transition Metals"
                    app.UITable.Data = groupedLookup(app, "t");
                case "Unknown"
                    app.UITable.Data = groupedLookup(app, "u");
            end
        end

        % Button pushed function: CompleteTableButton
        function CompleteTableButtonPushed(app, event)
            
            % Displaying the image and the back button
            app.Image3.Visible = "on";
            app.BackButton.Visible = "on";
        end

        % Button pushed function: BackButton
        function BackButtonPushed(app, event)
            
            % Hiding the image and the back button
            app.Image3.Visible = "off";
            app.BackButton.Visible = "off";
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Get the file path for locating images
            pathToMLAPP = fileparts(mfilename('fullpath'));

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 619 506];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.HandleVisibility = 'on';

            % Create Switch
            app.Switch = uiswitch(app.UIFigure, 'slider');
            app.Switch.Items = {'Simple', 'Grouped'};
            app.Switch.ValueChangedFcn = createCallbackFcn(app, @SwitchValueChanged, true);
            app.Switch.Position = [289 365 45 20];
            app.Switch.Value = 'Simple';

            % Create PleaseChooseDropDownLabel
            app.PleaseChooseDropDownLabel = uilabel(app.UIFigure);
            app.PleaseChooseDropDownLabel.HorizontalAlignment = 'right';
            app.PleaseChooseDropDownLabel.Position = [132 309 91 22];
            app.PleaseChooseDropDownLabel.Text = 'Please Choose: ';

            % Create GroupedDropdown
            app.GroupedDropdown = uidropdown(app.UIFigure);
            app.GroupedDropdown.Items = {'Actinoids', 'Alkali Metals', 'Alkaline Earth Metals', 'Lanthanoids', 'Metalloids', 'Noble Gases', 'Post-Trasition Metals', 'Reactive Nonmetals', 'Transition Metals', 'Unknown'};
            app.GroupedDropdown.Position = [238 306 237 28];
            app.GroupedDropdown.Value = 'Actinoids';

            % Create GoGrouped
            app.GoGrouped = uibutton(app.UIFigure, 'push');
            app.GoGrouped.ButtonPushedFcn = createCallbackFcn(app, @GoGroupedButtonPushed, true);
            app.GoGrouped.Position = [485 307 31 26];
            app.GoGrouped.Text = 'Go';

            % Create Panel
            app.Panel = uipanel(app.UIFigure);
            app.Panel.BorderColor = [0.9412 0.9412 0.9412];
            app.Panel.Position = [1 1 619 355];

            % Create PleaseEnterLabel
            app.PleaseEnterLabel = uilabel(app.Panel);
            app.PleaseEnterLabel.HorizontalAlignment = 'right';
            app.PleaseEnterLabel.Position = [147 321 77 22];
            app.PleaseEnterLabel.Text = 'Please Enter:';

            % Create PleaseEnterDropDown
            app.PleaseEnterDropDown = uidropdown(app.Panel);
            app.PleaseEnterDropDown.Items = {'Atomic Number', 'Atomic Symbol', 'Atomic Name'};
            app.PleaseEnterDropDown.ValueChangedFcn = createCallbackFcn(app, @PleaseEnterDropDownValueChanged, true);
            app.PleaseEnterDropDown.ClickedFcn = createCallbackFcn(app, @PleaseEnterDropDownClicked, true);
            app.PleaseEnterDropDown.Position = [239 318 237 28];
            app.PleaseEnterDropDown.Value = 'Atomic Number';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.Panel, 'text');
            app.EditField_2.InputType = 'letters';
            app.EditField_2.Editable = 'off';
            app.EditField_2.Visible = 'off';
            app.EditField_2.Position = [168 273 249 26];

            % Create EditField
            app.EditField = uieditfield(app.Panel, 'numeric');
            app.EditField.Limits = [1 118];
            app.EditField.Position = [167 273 249 26];
            app.EditField.Value = 1;

            % Create GoButton
            app.GoButton = uibutton(app.Panel, 'push');
            app.GoButton.ButtonPushedFcn = createCallbackFcn(app, @GoButtonPushed, true);
            app.GoButton.Position = [443 275 31 23];
            app.GoButton.Text = 'Go';

            % Create Image
            app.Image = uiimage(app.Panel);
            app.Image.Visible = 'off';
            app.Image.Position = [82 9 453 244];
            app.Image.ImageSource = fullfile(pathToMLAPP, 'tryAgain.jpeg');

            % Create TextArea
            app.TextArea = uitextarea(app.Panel);
            app.TextArea.HandleVisibility = 'off';
            app.TextArea.Editable = 'off';
            app.TextArea.HorizontalAlignment = 'center';
            app.TextArea.FontColor = [1 0 0];
            app.TextArea.Visible = 'off';
            app.TextArea.Position = [129 228 355 25];
            app.TextArea.Value = {'No Match Found!'};

            % Create UITable
            app.UITable = uitable(app.UIFigure);
            app.UITable.ColumnName = {'Atomic Number'; 'Atomic Symbol'; 'Atomic Name'};
            app.UITable.RowName = {};
            app.UITable.Visible = 'off';
            app.UITable.Position = [130 9 363 244];

            % Create CompleteTableButton
            app.CompleteTableButton = uibutton(app.UIFigure, 'push');
            app.CompleteTableButton.ButtonPushedFcn = createCallbackFcn(app, @CompleteTableButtonPushed, true);
            app.CompleteTableButton.BackgroundColor = [0.5961 0.8706 0.4];
            app.CompleteTableButton.Position = [516 365 105 35];
            app.CompleteTableButton.Text = 'Complete Table';

            % Create ThisprogramletsyouLabel
            app.ThisprogramletsyouLabel = uilabel(app.UIFigure);
            app.ThisprogramletsyouLabel.BackgroundColor = [0.651 0.651 0.651];
            app.ThisprogramletsyouLabel.HorizontalAlignment = 'center';
            app.ThisprogramletsyouLabel.FontSize = 16.5;
            app.ThisprogramletsyouLabel.FontWeight = 'bold';
            app.ThisprogramletsyouLabel.Position = [4 399 619 106];
            app.ThisprogramletsyouLabel.Text = 'This program lets you go through the atomic elements of the periodic table. ';

            % Create Image3
            app.Image3 = uiimage(app.UIFigure);
            app.Image3.ScaleMethod = 'stretch';
            app.Image3.Visible = 'off';
            app.Image3.Position = [1 1 622 506];
            app.Image3.ImageSource = fullfile(pathToMLAPP, 'atomicTable.jpg');

            % Create BackButton
            app.BackButton = uibutton(app.UIFigure, 'push');
            app.BackButton.ButtonPushedFcn = createCallbackFcn(app, @BackButtonPushed, true);
            app.BackButton.BackgroundColor = [0.5373 0.5216 0.6588];
            app.BackButton.Visible = 'off';
            app.BackButton.Position = [25 465 60 26];
            app.BackButton.Text = 'Back';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = project_stage6

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end