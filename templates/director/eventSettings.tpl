{**
 * eventSettings.tpl
 *
 * Copyright (c) 2003-2005 The Public Knowledge Project
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Basic event settings under site administration.
 *
 * $Id$
 *}

{assign var="pageTitle" value="director.events.schedulingAConference"}
{include file="common/header.tpl"}

<br />

<form method="post" action="{url op="updateEvent"}">
{if $eventId}
<input type="hidden" name="eventId" value="{$eventId}" />
{/if}
<input type="hidden" name="conferenceId" value="{$conferenceId}" />

{include file="common/formErrors.tpl"}

{if not $eventId}
<p><span class="instruct">{translate key="director.events.createInstructions"}</span></p>
{/if}

<table class="data" width="100%">
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="title" key="director.events.eventTitle" required="true"}</td>
		<td width="80%" class="value"><input type="text" id="title" name="title" value="{$title|escape}" size="40" maxlength="120" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="startDate" key="director.events.eventStartDate" required="true"}</td>
		<td width="80%" class="value">
			{html_select_date prefix="startDate" time=$startDate all_extra="class=\"selectMenu\"" year_empty="" month_empty="" day_empty="" start_year="+0" end_year=$dateExtentFuture}
		</td>
	</tr>
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="endDate" key="director.events.eventEndDate" required="true"}</td>
		<td width="80%" class="value">
			{html_select_date prefix="endDate" time=$endDate all_extra="class=\"selectMenu\"" year_empty="" month_empty="" day_empty="" start_year="+0" end_year=$dateExtentFuture}
		</td>
	</tr>
	<tr valign="top">
		<td class="label">{fieldLabel name="title" key="common.path" required="true"}</td>
		<td class="value">
			<input type="text" id="path" name="path" value="{$path|escape}" size="16" maxlength="32" class="textField" />
			<br />
			{translate|assign:"sampleEllipsis" key="common.ellipsis"}
			{url|assign:"sampleUrl" event="path" page="$sampleEllipsis"}
			<span class="instruct">{translate key="director.events.urlWillBe" sampleUrl=$sampleUrl}</span>
		</td>
	</tr>
	<tr valign="top">
		<td colspan="2" class="label">
			<input type="checkbox" name="enabled" id="enabled" value="1"{if $enabled} checked="checked"{/if} /> <label for="enabled">{translate key="director.events.enableEventInstructions"}</label>
		</td>
	</tr>
</table>

<p><input type="submit" value="{translate key="common.save"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="events" escape=false}'" /></p>

</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

{include file="common/footer.tpl"}
