
#
# CBRAIN Project
#
# Copyright (C) 2008-2012
# The Royal Institution for the Advancement of Learning
# McGill University
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

require 'rails_helper'

describe BrainPortal do
  let(:current_bp) {create(:brain_portal)}

  describe "#lock" do
    it "should be locked after lock was called" do
      current_bp.portal_locked = false
      current_bp.lock!
      expect(current_bp.portal_locked).to be true
    end
  end

  describe "#unlock" do
    it "should be unlocked after unlock was called" do
      current_bp.portal_locked = true
      current_bp.unlock!
      expect(current_bp.portal_locked).to be false
    end
  end

end

