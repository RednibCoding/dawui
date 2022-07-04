/* MIT License

Copyright (c) 2022 RednibCoding

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. */

const String dawuiCssStatic = r"""

/****************************************************************************/
/* Modal Dialog                                                             */
/****************************************************************************/
.dawui-modal-backdrop {
  display: none;
  position: fixed;
  z-index: 1;
  overflow: auto;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.2);
}

.dawui-modal-box {
  background: transparent;
  border-radius: 60px;
  position: fixed;
  z-index: 1;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  box-shadow: 0 9px 46px 8px rgb(0 0 0 / 14%), 0 11px 15px -7px rgb(0 0 0 / 12%), 0 24px 38px 3px rgb(0 0 0 / 20%);
}

/****************************************************************************/
/* TEXTFIELD                                                                */
/****************************************************************************/

.dawui-textfield {
  border: none;
  outline: none;
  position: relative;
  border-bottom: 1px solid rgba(0,0,0, 0.1);
  font-size: 16px;
  display: inline-block;
  box-sizing: border-box;
  display: block;
  font-size: 16px;
  font-family: "Helvetica", "Arial", sans-serif;
  margin: 0;
  background: none;
  text-align: left;
  color: inherit;
  width: 300px;
  max-width: 100%;
  min-width: 32px;
  width: auto;
  min-height: 32px;
}

.dawui-textfield:focus:not(:active){
    border-bottom: 1px solid rgba(var(--textfield-border-color), 0.5);
}

.dawui-textfield[type="number"] {
  -moz-appearance: textfield;
}

.dawui-textfield[type="number"]::-webkit-inner-spin-button, .dawui-textfield[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

.dawui-textfield:disabled {
  background-color: transparent;
  border-bottom: 1px dotted rgba(0,0,0, 0.12);
  color: rgba(0,0,0, 0.26);
}

.dawui-textfield:disabled::placeholder {
  color: rgba(0,0,0, 0.26);
  opacity: 1; /* Firefox */
}

.dawui-textfield:disabled:-ms-input-placeholder {
  color: rgba(0,0,0, 0.26);
}

.dawui-textfield:disabled::-ms-input-placeholder:disabled {
  color: rgba(0,0,0, 0.26);
}

.dawui-textfield[type="number"] {
  -moz-appearance: textfield;
}
.dawui-textfield[type="number"]::-webkit-inner-spin-button, .dawui-textfield[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/****************************************************************************/
/* TEXTAREA                                                                 */
/****************************************************************************/

.dawui-textarea {
  border: 1px solid rgba(0,0,0, 0.1);
  border-radius: 4px;
  outline: none;
  position: relative;
  display: inline-block;
  box-sizing: border-box;
  display: block;
  font-size: 16px;
  font-family: "Helvetica", "Arial", sans-serif;
  margin: 0;
  background: none;
  text-align: left;
  color: inherit;
  width: 300px;
  max-width: 100%;
  min-width: 64px;
  width: auto;
  min-height: 64px;
}

.dawui-textarea:disabled {
  background-color: transparent;
  border: 1px solid rgba(0, 0, 0, 0.26);
  color: rgba(0,0,0, 0.26);
}

.dawui-textarea[readOnly] {
  background-color: transparent;
  border: 1px solid rgba(0, 0, 0, 0.26);
  color: rgba(0,0,0, 0.70);
}

.dawui-textarea:focus:not(:active){
    border: 1px solid rgba(var(--textarea-border-color), 0.5);
}


/****************************************************************************/
/* TABBAR                                                                   */
/****************************************************************************/

.dawui-tabs {
  display: block;
  width: 100%;
}

.dawui-tabs__tab-bar {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-justify-content: flex-start;
      -ms-flex-pack: flex-start;
          justify-content: flex-start;
  -webkit-align-content: space-between;
      -ms-flex-line-pack: justify;
          align-content: space-between;
  -webkit-align-items: flex-start;
      -ms-flex-align: start;
          align-items: flex-start;
  height: 48px;
  padding: 0 0 0 0;
  margin: 0;
}

.tab-bar--show-border {
  border-bottom: 3px solid rgb(var(--tabview-border-color));
}

.dawui-tabs__tab-head {
  margin: 0;
  border: none;
  padding: 0 24px 0 24px;
  float: left;
  position: relative;
  display: block;
  text-decoration: none;
  height: 48px;
  line-height: 48px;
  text-align: center;
  font-weight: 500;
  font-size: 14px;
  /* color: rgba(0,0,0, 0.54); */
  background-color: transparent;
  overflow: hidden;
  cursor: pointer;
  -moz-user-select: none;
  -khtml-user-select: none;
  -webkit-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

.dawui-tabs__tab-head:hover {
  /* color: rgba(0,0,0, 1); */
  background-color: rgba(158,158,158, 0.20);
}

.dawui-tabs__tab-head--active {
  /* color: rgba(0,0,0, 1); */
  border-bottom: 3px solid rgb(var(--tabview-active-border-color));
  background-color: rgba(158,158,158, 0.125);
}

.dawui-tabs__tab-content {
  display: none;
}

.dawui-tabs__tab-content--active {
  display: block;
}

/****************************************************************************/
/* BUTTONS                                                                  */
/****************************************************************************/

/* base */
.dawui-button {
  background: transparent;
  border: none;
  border-radius: 2px;
  position: relative;
  height: 36px;
  margin: 0;
  padding: 0 16px;
  display: inline-block;
  font-size: 14px;
  font-weight: 500;
  line-height: 1;
  letter-spacing: 0;
  overflow: hidden;
  will-change: box-shadow;
  transition: box-shadow 0.2s cubic-bezier(0.4, 0, 1, 1), background-color 0.2s cubic-bezier(0.4, 0, 0.2, 1), color 0.2s cubic-bezier(0.4, 0, 0.2, 1);
  outline: none;
  cursor: pointer;
  text-decoration: none;
  text-align: center;
  vertical-align: middle;
}

.dawui-button:disabled {
  color: rgba(0,0,0, 0.26);
  cursor: default;
  background-color: transparent;
}

/* raised effect */
.dawui-button--raised {
  background: rgba(158,158,158, 0.20);
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}
.dawui-button--raised:active {
    box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.2);
    background-color: rgba(158,158,158, 0.40);
}

.dawui-button--raised[disabled][disabled], .dawui-button--raised.dawui-button--disabled.dawui-button--disabled {
  background-color: rgba(0,0,0, 0.12);
  color: rgba(0,0,0, 0.26);
  box-shadow: none;
}

.dawui-button::-moz-focus-inner {
  border: 0;
}

.dawui-button:hover {
  background-color: rgba(158,158,158, 0.20);
}

.dawui-button:active {
  background-color: rgba(158,158,158, 0.40);
}

input.dawui-button[type="submit"] {
  -webkit-appearance: none;
}

/* primary colored button */
.dawui-button--raised.dawui-button--primary {
  background: rgb(var(--btn-color-primary));
  color: rgb(255,255,255);
}

.dawui-button--raised.dawui-button--primary:hover {
      background-color: rgba(var(--btn-color-primary), 0.7);
}

.dawui-button--raised.dawui-button--primary:active {
  background-color: rgb(var(--btn-color-primary));
}

.dawui-button--primary[disabled][disabled], .dawui-button--primary.dawui-button--disabled.dawui-button--disabled {
  color: rgba(0,0,0, 0.26);
}

/* secondary colored button */
.dawui-button--raised.dawui-button--secondary {
  background: rgb(var(--btn-color-secondary));
  color: rgb(255,255,255);
}

.dawui-button--raised.dawui-button--secondary:hover {
      background-color: rgba(var(--btn-color-secondary), 0.7);
}

.dawui-button--raised.dawui-button--secondary:active {
  background-color: rgb(var(--btn-color-secondary));
}

.dawui-button--secondary[disabled][disabled], .dawui-button--secondary.dawui-button--disabled.dawui-button--disabled {
  color: rgba(0,0,0, 0.26);
}

/* accent colored button */
.dawui-button--raised.dawui-button--accent {
  background: rgb(var(--btn-color-accent));
  color: rgb(255,255,255);
}

.dawui-button--raised.dawui-button--accent:hover {
      background-color: rgb(var(--btn-color-accent), 0.7);
}

.dawui-button--raised.dawui-button--accent:active {
  background-color: rgb(var(--btn-color-accent));
}

.dawui-button--accent[disabled][disabled], .dawui-button--accent.dawui-button--disabled.dawui-button--disabled {
  color: rgba(0,0,0, 0.26);
}

/* action button */
.dawui-button--action {
  background: transparent;
  border: none;
  border-radius: 50%;
  font-size: 24px;
  height: 56px;
  margin: auto;
  width: 56px;
  padding: 0;
  overflow: hidden;
  position: relative;
  line-height: normal;
}

.dawui-button--action:hover {
  background-color: rgba(158,158,158, 0.20);
}

.dawui-button--action:active {
  box-shadow: 0 4px 5px 0 rgba(0, 0, 0, 0.14), 0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.2);
  background-color: rgba(158,158,158, 0.40);
}

.dawui-button--action.dawui-button--primary {
    background: rgb(var(--btn-color-primary));
    color: rgb(255,255,255);
}

.dawui-button--action.dawui-button--primary:hover {
  background-color: rgb(var(--btn-color-primary), 0.7);
}

.dawui-button--action.dawui-button--primary:active {
  background-color: rgb(var(--btn-color-primary));
}

.dawui-button--action.dawui-button--secondary {
    background: rgb(var(--btn-color-secondary));
    color: rgb(255,255,255);
}

.dawui-button--action.dawui-button--secondary:hover {
  background-color: rgb(var(--btn-color-secondary), 0.7);
}

.dawui-button--action.dawui-button--secondary:active {
  background-color: rgb(var(--btn-color-secondary));
}

.dawui-button--action.dawui-button--accent {
    background: rgb(var(--btn-color-accent));
    color: rgb(255,255,255);
}

.dawui-button--action.dawui-button--accent:hover {
  background-color: rgb(var(--btn-color-accent), 0.7);
}

.dawui-button--action.dawui-button--accent:active {
  background-color: rgb(var(--btn-color-accent));
}

.dawui-button--action[disabled][disabled], .dawui-button--action.dawui-button--disabled.dawui-button--disabled {
  background-color: rgba(0,0,0, 0.12);
  color: rgba(0,0,0, 0.26);
}


""";
