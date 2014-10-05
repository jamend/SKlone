<%@ Page Language="vb" AutoEventWireup="false" Codebehind="ProfileEdit.aspx.vb" Inherits="SKlone.ProfileEdit" %>
<%@ Register TagPrefix="sklone" TagName="TopInfoBar" Src="TopInfoBar.ascx" %>
<%@ Register TagPrefix="sklone" TagName="BottomInfoBar" Src="BottomInfoBar.ascx" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<TITLE>Status</TITLE>
		<ASP:LABEL id="lblLand" runat="server"></ASP:LABEL>
		<META content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<META content="Visual Basic .NET 7.1" name="CODE_LANGUAGE">
		<META content="JavaScript" name="vs_defaultClientScript">
		<META content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
		<STYLE>A:link { COLOR: #447cff; TEXT-DECORATION: none }
	A:visited { COLOR: #447cff; TEXT-DECORATION: none }
	A:hover { COLOR: #4e9f5f; TEXT-DECORATION: underline }
		</STYLE>
	</HEAD>
	<BODY text="#ffffff" vlink="#447cff" alink="#4e9f5f" link="#447cff" bgcolor="#000000">
		<P align="center"><BR>
		</P>
		<FORM id="Form1" runat="server">
			<P align="center"><SKLONE:TOPINFOBAR id="Topinfobar1" runat="server"></SKLONE:TOPINFOBAR></P>
			<FONT face="verdana" size="1">
				<P align="center">
					<asp:Label id="lblError" runat="server" ForeColor="#FFFF80" Font-Bold="True"></asp:Label></P>
				<table width="98%" border="0" cellspacing="0" cellpadding="1" bgcolor="#999999" align="center">
					<tr>
						<td style="HEIGHT: 1129px" bgColor="#a6aad3">
							<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
								<tr>
									<td bgcolor="#a6aad3">
										<table width="100%" border="0" cellspacing="1" cellpadding="3" height="14" bgcolor="#ffffff">
											<tr bgcolor="#a6aad3">
												<td colspan="2" background="forum_images/table_bg_image.gif" class="tHeading" style="COLOR: black">Registration 
													Details</td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td colspan="2" bgcolor="#f4f4fb" background="" class="text" style="COLOR: black">*Indicates 
													required fields</td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" bgcolor="#f4f4fb" background="" class="text" style="WIDTH: 145px; COLOR: black; HEIGHT: 29px">Username*<br>
													<span class="smText">This is the name displayed when you use the forum</span></td>
												<td width="50%" bgcolor="#f4f4fb" background="" class="text" style="HEIGHT: 29px">
													<asp:Label id="lblKingdomName" runat="server" ForeColor="Black"></asp:Label></td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">Email 
													Address
													<br>
													<span class="smText">Not required, but useful if you wish to be notified when 
														someone answers one of your posts or if you lose your password.</span><br>
												</td>
												<td width="50%" valign="top" background="">
													<asp:TextBox id="txtEmail" runat="server" Width="183px"></asp:TextBox></td>
											</tr>
											<tr bgcolor="#a6aad3">
												<td colspan="2" background="forum_images/table_bg_image.gif" class="tHeading" style="COLOR: black">Profile 
													Information (not required)</td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">Real 
													Name</td>
												<td width="50%" background="">
													<asp:TextBox id="txtRealName" runat="server" Width="183px"></asp:TextBox></td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">Location</td>
												<td width="50%" background="">
													<asp:TextBox id="txtLocation" runat="server" Width="183px"></asp:TextBox>
												</td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">Homepage</td>
												<td width="50%" background="">
													<asp:TextBox id="txtHomePage" runat="server" Width="183px"></asp:TextBox></td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">ICQ 
													Number</td>
												<td width="50%" background="">
													<asp:TextBox id="txtICQ" runat="server" Width="183px"></asp:TextBox></td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">AIM 
													Address</td>
												<td width="50%" background="">
													<asp:TextBox id="txtAIM" runat="server" Width="183px"></asp:TextBox></td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">MSN 
													Messenger</td>
												<td width="50%" background="">
													<asp:TextBox id="txtMSN" runat="server" Width="183px"></asp:TextBox></td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">Yahoo 
													Messenger</td>
												<td width="50%" background="">
													<asp:TextBox id="txtYahoo" runat="server" Width="183px"></asp:TextBox></td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">Occupation</td>
												<td width="50%" background="">
													<asp:TextBox id="txtOccupation" runat="server" Width="183px"></asp:TextBox></td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">Interests</td>
												<td width="50%" background="">
													<asp:TextBox id="txtInterests" runat="server" Width="183px"></asp:TextBox></td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td width="145" class="text" background="" style="WIDTH: 145px; COLOR: black">Date 
													of Birth</td>
												<td width="50%" background="" class="text">
													<asp:TextBox id="txtBirth" runat="server" Width="183px"></asp:TextBox>
												</td>
											</tr>
											<tr bgcolor="#f4f4fb" background="">
												<td valign="top" height="2" class="text" background="" style="WIDTH: 145px; COLOR: black">Select 
													Avatar
													<br>
													<span class="smText">This is the small icon shown next to your posts. Either select 
														one from the list or type the path in to your own Avatar (must be 64 x 64 
														pixels).</span></td>
												<td valign="top" height="2" background="">
													<table width="351" border="0" cellspacing="0" cellpadding="1" style="WIDTH: 351px; HEIGHT: 121px">
														<tr>
															<td width="168">
																<select name="SelectAvatar" size="4" onChange="(avatar.src = SelectAvatar.options[SelectAvatar.selectedIndex].value) &amp;&amp; (txtAvatar.value=avatar.src) &amp;&amp; (oldAvatar.value='')">
																	<option value="forum_images/blank.gif">None Selected</option>
																	<option value="avatars/abstract.jpg">Abstract</option>
																	<option value="avatars/alien_helmet.jpg">Alien Helmet</option>
																	<option value="avatars/anglewings.jpg">Anglewings</option>
																	<option value="avatars/axe.jpg">Axe</option>
																	<option value="avatars/basket.jpg">Basket</option>
																	<option value="avatars/bass_fret.jpg">Bass</option>
																	<option value="avatars/animal_bear.jpg">Bear</option>
																	<option value="avatars/animal_bird.jpg">Bird</option>
																	<option value="avatars/hiro_bird2.jpg">Bird II</option>
																	<option value="avatars/hiro_bird2_neg.jpg">Bird II Negative</option>
																	<option value="avatars/hiro_bird.jpg">Bird III</option>
																	<option value="avatars/character_bonehead.jpg">Bonehead</option>
																	<option value="avatars/box_avatar.gif">Box Avatar</option>
																	<option value="avatars/animal_butterfly.jpg">Butterfly I</option>
																	<option value="avatars/butterfly2.jpg">Butterfly II</option>
																	<option value="avatars/butterfly3.jpg">Butterfly III</option>
																	<option value="avatars/animal_butterfly_neg.jpg">Butterfly Negative</option>
																	<option value="avatars/candle.jpg">Candle</option>
																	<option value="avatars/character_catafly.jpg">Catafly</option>
																	<option value="avatars/center.jpg">Center</option>
																	<option value="avatars/chi.gif">Chi</option>
																	<option value="avatars/character_cyclops.jpg">Cyclops</option>
																	<option value="avatars/darksword.jpg">Dark Sword</option>
																	<option value="avatars/dragon_eye.jpg">Dragon Eye</option>
																	<option value="avatars/animal_doggy.jpg">Doggy</option>
																	<option value="avatars/animal_doggy2.jpg">Doggy II</option>
																	<option value="avatars/hiro_dolphin.jpg">Dolphin</option>
																	<option value="avatars/hiro_dolphin_neg.jpg">Dolphin Negative</option>
																	<option value="avatars/animal_duck.jpg">Duck</option>
																	<option value="avatars/animal_eel.jpg">Eel</option>
																	<option value="avatars/eye.jpg">Eye</option>
																	<option value="avatars/eye2.jpg">Eye II</option>
																	<option value="avatars/eye_storm.jpg">Eye Storm</option>
																	<option value="avatars/flower.jpg">Flower</option>
																	<option value="avatars/flower2.jpg">Flower II</option>
																	<option value="avatars/flying.jpg">Flying</option>
																	<option value="avatars/funkyfish.jpg">Funky Fish</option>
																	<option value="avatars/hiro_giraff.jpg">Giraff</option>
																	<option value="avatars/hiro_giraff_neg.jpg">Giraff Negative</option>
																	<option value="avatars/gorilla_skull.jpg">Gorilla Skull</option>
																	<option value="avatars/half_planet.jpg">Half Planet</option>
																	<option value="avatars/hiro_horse.jpg">Horse</option>
																	<option value="avatars/hiro_horse_neg.jpg">Horse Negative</option>
																	<option value="avatars/hand_neg.jpg">Hand Negative</option>
																	<option value="avatars/kanji_for_peace.jpg">Kanji For Peace</option>
																	<option value="avatars/leaf.jpg">Leaf</option>
																	<option value="avatars/lightbulb.jpg">Lightbulb</option>
																	<option value="avatars/lightening.jpg">Lightening</option>
																	<option value="avatars/lighthouse.jpg">Lighthouse</option>
																	<option value="avatars/animal_lizard.jpg">Lizard</option>
																	<option value="avatars/mask.jpg">Mask</option>
																	<option value="avatars/metalbird.jpg">Metalbird</option>
																	<option value="avatars/animal_monkey.jpg">Monkey</option>
																	<option value="avatars/animal_monkey2.jpg">Monkey II</option>
																	<option value="avatars/moon.jpg">Moon</option>
																	<option value="avatars/octa_feathers.jpg">Octa Feathers</option>
																	<option value="avatars/aninal_peac.jpg">Peacock</option>
																	<option value="avatars/character_pinprick.jpg">Pinprick</option>
																	<option value="avatars/praying_hands.jpg">Praying Hands</option>
																	<option value="avatars/pyramid.jpg">Pyramid</option>
																	<option value="avatars/radar.jpg">Radar</option>
																	<option value="avatars/redcross.jpg">Redcross</option>
																	<option value="avatars/rocking_horse.jpg">Rocking Horse</option>
																	<option value="avatars/scifi_planet_probe.jpg">Scifi Planet Probe</option>
																	<option value="avatars/seabug1.jpg">Sea Bug</option>
																	<option value="avatars/seecreature.jpg">Sea Creature</option>
																	<option value="avatars/seahorse_animation.gif">Seahorse Animation</option>
																	<option value="avatars/animal_shark.jpg">Shark</option>
																	<option value="avatars/shape_barbed.jpg">Shape Barbed</option>
																	<option value="avatars/shapes_quad_feather.jpg">Shapes Quad Feather</option>
																	<option value="avatars/side_smile.jpg">Side Smile</option>
																	<option value="avatars/side_smile_b.jpg">Side Smile II</option>
																	<option value="avatars/character_space_monkey.jpg">Space Monkey</option>
																	<option value="avatars/Sphere_animated2.gif">Sphere Animated</option>
																	<option value="avatars/Sphere_animated_small_ neg2.gif">Sphere Animated II</option>
																	<option value="avatars/spherewall.gif">Sphere Wall</option>
																	<option value="avatars/spider.jpg">Spider</option>
																	<option value="avatars/stone_face.jpg">Stone Face</option>
																	<option value="avatars/stone_fish.jpg">Stone Fish</option>
																	<option value="avatars/scene_sunoverlake.jpg">Sun over Lake</option>
																	<option value="avatars/scene_sunovermountains.jpg">Sun over Mountains</option>
																	<option value="avatars/animal_swan.jpg">Swan</option>
																	<option value="avatars/shapes_swish.jpg">Swish</option>
																	<option value="avatars/shapes_taran.jpg">Taran</option>
																	<option value="avatars/techno_eye.jpg">Techno Eye</option>
																	<option value="avatars/animal_vultar.jpg">Vultar</option>
																	<option value="avatars/character_warrior.jpg">Warrior</option>
																	<option value="avatars/scenery_water_mountains.jpg">Water Mountains</option>
																	<option value="avatars/waveform.jpg">Waveform</option>
																	<option value="avatars/web.jpg">Web</option>
																	<option value="avatars/animal_whale.jpg">Whale</option>
																	<option value="avatars/white_face.jpg">White Face</option>
																	<option value="avatars/WINGS.jpg">Wings</option>
																	<option value="avatars/wings2.jpg">Wings II</option>
																	<option value="avatars/wired_shell.jpg">Wired Shell</option>
																</select>
															</td>
															<td width="122" align="center"><img src="forum_images/blank.gif" width="64" height="64" name="avatar">
																<input type="hidden" name="oldAvatar"></td>
														</tr>
														<br>
														<tr>
															<td width="168">
																<asp:TextBox id="txtAvatar" runat="server" Width="183px"></asp:TextBox>
															</td>
															<td width="122">
																<input type="button" name="preview" value="Preview" onClick="avatar.src = txtAvatar.value">
															</td>
														</tr>
														<tr>
															<td width="122">&nbsp;
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr bgcolor="#e6e7f2" background="">
												<td valign="top" height="2" colspan="2" align="center" background="">&nbsp;&nbsp;&nbsp;&nbsp;
													<ASP:BUTTON id="cmdUpdate" runat="server" forecolor="White" text="Update Profile" backcolor="#000488"
														bordercolor="#005AFF" font-names="Verdana"></ASP:BUTTON>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<br>
			</FONT>
			<P align="center"><SKLONE:BOTTOMINFOBAR id="BottomInfoBar1" runat="server"></SKLONE:BOTTOMINFOBAR></P>
		</FORM>
	</BODY>
</HTML>
